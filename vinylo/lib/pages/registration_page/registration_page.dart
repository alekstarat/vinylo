import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/login_page/login_page.dart';
import 'package:vinylo/pages/registration_page/components/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

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
              
              const RegistrationForm(),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Есть аккаунт? ",
                      style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor
                      ),
                      ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)  => const LoginPage()));
                        
                      },
                      child: Text(
                        "Вход",
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