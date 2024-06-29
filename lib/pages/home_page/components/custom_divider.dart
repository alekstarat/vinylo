import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/20,
      child: Center(
        child: Divider(
          color: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
          indent: 16,
          endIndent: 16,
        ),
      ),
    );
  }
}