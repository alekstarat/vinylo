import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:vinylo/pages/login_page/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:vinylo/pages/login_page/components/login_form.dart';
import 'package:vinylo/pages/registration_page/registration_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: SafeArea(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(
              userRepository: context.read<AuthenticationBloc>().userRepository
            ),
            child: const LoginForm(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Нет аккаунта? ",
                  style: TextStyle(
                      color: ThemeProvider.themeOf(context).data.primaryColor),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            settings: const RouteSettings(name: "Home"),
                              builder: (context) => const RegistrationPage()));
                    },
                    child: Text(
                      "Регистрация",
                      style: TextStyle(
                          color:
                              ThemeProvider.themeOf(context).data.focusColor),
                    ))
              ],
            ),
          )
        ],
      ))),
    );
  }
}
