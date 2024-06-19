import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:user_repository/user_repository.dart';
import 'package:vinylo/pages/home_page/home_page.dart';
import 'package:vinylo/pages/login_page/models/button_model.dart';
import 'package:vinylo/pages/login_page/models/textfield_model.dart';
import 'package:vinylo/pages/login_page/views/button_view.dart';
import 'package:vinylo/pages/login_page/views/textfield_view.dart';

import '../blocs/sign_up_bloc/sign_up_bloc.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // ignore: unused_field
  String? _errorMessage;
  bool signUpRequired = false;
  final TextfieldModel loginModel = TextfieldModel(hint: "Электронная почта");
  final TextfieldModel passwordModel =
      TextfieldModel(hint: "Пароль", obscure: true, isObscured: true);
  final TextfieldModel passwordConfirmModel =
      TextfieldModel(hint: "Повтор пароля", obscure: true, isObscured: true);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if(state is SignUpSuccess) {
					setState(() {
					  signUpRequired = false;
					});
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
					// Navigator.pop(context);
				} else if(state is SignUpProcess) {
					setState(() {
					  signUpRequired = true;
					});
				}  else if(state is SignUpFailure) {
					return;
				} 
      },
      child: SizedBox(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Регистрация",
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
            height: kToolbarHeight * 0.3,
          ),
          TextfieldView(model: passwordConfirmModel),
          const SizedBox(
            height: kToolbarHeight,
          ),
          ButtonView(
              model: ButtonModel(
                  label: "Зарегистрироваться",
                  onTap: () {
                    if (loginModel.controller.text != "" && 
                      passwordModel.controller.text != "" && 
                      passwordConfirmModel.controller.text == passwordModel.controller.text) {
                        MyUser myUser = MyUser.empty;
                        myUser = myUser.copyWith(
                          email: loginModel.controller.text
                        );
                        setState(() {
                          context.read<SignUpBloc>().add(
                            SignUpRequired(myUser, passwordModel.controller.text)
                          );
                        });

                    }
                  })),
        ],
      )),
    );
  }
}
