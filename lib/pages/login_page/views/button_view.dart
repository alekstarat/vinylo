import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/login_page/models/button_model.dart';

class ButtonView extends StatelessWidget {

  final ButtonModel model;

  const ButtonView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => model.onTap(),
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        height: kToolbarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ThemeProvider.themeOf(context).data.primaryColor
        ),
        child: Center(
          child: Text(
            model.label,
            style: TextStyle(
              color: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 12
            ),
          ),
        ),
      )
    );
  }
}