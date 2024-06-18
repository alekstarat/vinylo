import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/login_page/login_page.dart';
import 'package:vinylo/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:user_repository/user_repository.dart';
import 'package:vinylo/pages/home_page/home_page.dart';
import 'package:vinylo/pages/login_page/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:vinylo/pages/login_page/login_page.dart';

import 'package:vinylo/theme.dart';

class App extends StatelessWidget {
  final UserRepository userRepository;

  const App(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
>>>>>>> Stashed changes
    final themeManager = ThemeManager();

    return Provider<ThemeManager>.value(
      value: themeManager,
      child: ThemeProvider(
        themes: themeManager.themes,
        child: ThemeConsumer(
          child: Builder(
<<<<<<< Updated upstream
            builder: (themeContext) => MaterialApp(
              theme: ThemeProvider.themeOf(themeContext).data,
                debugShowCheckedModeBanner: false,
                home: const LoginPage()
              )
          ),
=======
              builder: (themeContext) => RepositoryProvider<AuthenticationBloc>(
                    create: (context) =>
                        AuthenticationBloc(userRepository: userRepository),
                    child: MaterialApp(
                      theme: ThemeProvider.themeOf(themeContext).data,
                      debugShowCheckedModeBanner: false,
                      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state.status == AuthenticationStatus.authenticated) {
                            return const HomePage();
                          }  else {
                            return const LoginPage();
                          }
                        },
                      ),
                    ),
                  )),
>>>>>>> Stashed changes
        ),
      ),
    );
  }
<<<<<<< Updated upstream
}
=======
}
>>>>>>> Stashed changes
