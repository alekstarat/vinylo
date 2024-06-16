import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/theme.dart';

class ChangeThemeOption extends StatefulWidget {
  const ChangeThemeOption({super.key});

  @override
  State<ChangeThemeOption> createState() => _ChangeThemeOptionState();
}

class _ChangeThemeOptionState extends State<ChangeThemeOption> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Тёмная тема",
        style: TextStyle(
          color: ThemeProvider.themeOf(context).data.primaryColor,
          fontWeight: FontWeight.bold
        )
      ),
      trailing: Switch(
        activeColor: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        value: Provider.of<ThemeManager>(context).isDark,
        onChanged:(bool isSelected) { 
          Provider.of<ThemeManager>(context, listen: false).changeTheme(context);
        },
      ),
    );
  }
}