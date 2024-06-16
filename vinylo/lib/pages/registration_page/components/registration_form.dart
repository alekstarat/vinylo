import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/home_page.dart';
import 'package:vinylo/pages/login_page/models/button_model.dart';
import 'package:vinylo/pages/login_page/models/textfield_model.dart';
import 'package:vinylo/pages/login_page/views/button_view.dart';
import 'package:vinylo/pages/login_page/views/textfield_view.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Регистрация",
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
          const SizedBox(height: kToolbarHeight*0.3,),
          TextfieldView(model: TextfieldModel(hint: "Повтор пароля", obscure: true, isObscured: true)),
          const SizedBox(height: kToolbarHeight,),
          ButtonView(model: ButtonModel(label: "Зарегистрироваться", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
          })),

          
        ],
      )
    );
  }
}