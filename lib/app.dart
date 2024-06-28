import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:user_repository/user_repository.dart';
import 'package:vinylo/models/cart.dart';
import 'package:vinylo/pages/home_page/home_page.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';import 'package:vinylo/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:vinylo/theme.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;
  final DatabaseRepository databaseRepository;

  App(this.userRepository, this.databaseRepository,
      {super.key});

  final themeManager = ThemeManager();

  @override
  Widget build(BuildContext context) {
    return Provider<CartModel>.value(
      // ignore: prefer_const_literals_to_create_immutables
      value: CartModel(cart: []),
      child: Provider<ThemeManager>.value(
        value: themeManager,
        child: ThemeProvider(
          themes: themeManager.themes,
          child: ThemeConsumer(
            child: Builder(
                builder: (themeContext) => MultiRepositoryProvider(
                      providers: [
                        RepositoryProvider<AuthenticationBloc>(
                          create: (context) => AuthenticationBloc(
                              userRepository: userRepository),
                        ),
                        RepositoryProvider<DatabaseRepository>(
                          create: (context) => databaseRepository
                        )
                      ],
                      child: MaterialApp(
                        theme: ThemeProvider.themeOf(themeContext).data,
                        debugShowCheckedModeBanner: false,
                        home: BlocBuilder<AuthenticationBloc,
                            AuthenticationState>(
                          builder: (context, state) {
                            if (state.status ==
                                AuthenticationStatus.authenticated) {
                              return HomePage(
                                  databaseRepository);
                            } else {
                              return const LoginPage();
                            }
                          },
                        ),
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
