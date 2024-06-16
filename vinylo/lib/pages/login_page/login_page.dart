import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
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
              
              const LoginForm(),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Нет аккаунта? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)  => const RegistrationPage()));
                        
                      },
                      child: Text(
                        "Регистрация",
                        style: TextStyle(
                          color: ThemeProvider.themeOf(context).data.focusColor
                        ),
                      )
                    )
                  ],
                ),
              )
            ],
          )
        )
      ),
    );
  }
}