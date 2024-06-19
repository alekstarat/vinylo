import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/home_page.dart';
import 'package:vinylo/pages/login_page/blocs/sign_in_bloc/sign_in_bloc.dart';
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
  // ignore: unused_field
  String? _errorMessage;
  bool signInRequired = false;
  final TextfieldModel loginModel = TextfieldModel(hint: "Электронная почта");
  final TextfieldModel passwordModel =
      TextfieldModel(hint: "Пароль", obscure: true, isObscured: true);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          setState(() {
            signInRequired = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (state is SignInProcess) {
          setState(() {
            signInRequired = true;
          });
        } else if (state is SignInFailure) {
          setState(() {
            signInRequired = false;
            _errorMessage = "Неправильный логин или пароль";
          });
        }
      },
      child: SizedBox(
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
                    fontSize: 40),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              TextfieldView(model: loginModel),
              const SizedBox(
                height: kToolbarHeight * 0.3,
              ),
              TextfieldView(model: passwordModel),
              const SizedBox(
                height: kToolbarHeight,
              ),
              ButtonView(
                  model: ButtonModel(
                      label: "Войти",
                      onTap: () {
                        if (loginModel.controller.text != "" && passwordModel.controller.text != "") {
                          context.read<SignInBloc>().add(SignInRequired(loginModel.controller.text, passwordModel.controller.text));
                        }
                      }
                    )
                  ),
            ],
          )),
    );
  }
}
