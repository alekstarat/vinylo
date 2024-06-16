import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/home_page.dart';
import 'package:vinylo/pages/login_page/models/button_model.dart';
import 'package:vinylo/pages/login_page/models/textfield_model.dart';
import 'package:vinylo/pages/login_page/views/button_view.dart';
import 'package:vinylo/pages/login_page/views/textfield_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Вход",
            style: TextStyle(
              color: ThemeProvider.themeOf(context).data.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 40
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
          TextfieldView(model: TextfieldModel(hint: "Имя пользователя")),
          const SizedBox(height: kToolbarHeight*0.3,),
          TextfieldView(model: TextfieldModel(hint: "Пароль", obscure: true, isObscured: true)),
          const SizedBox(height: kToolbarHeight,),
          ButtonView(model: ButtonModel(label: "Войти", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          })),

          
        ],
      )
    );
  }
}