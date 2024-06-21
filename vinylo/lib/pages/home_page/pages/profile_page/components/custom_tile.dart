import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class CustomTile extends StatelessWidget {

  final Icon icon;
  final String label;

  const CustomTile({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        label,
        style: TextStyle(
          color: ThemeProvider.themeOf(context).data.primaryColor,
          fontFamily: "Ubuntu",
          fontSize: 17
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: ThemeProvider.themeOf(context).data.primaryColor,
      ),
    );
  }
}