import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/settings_page/components/change_theme_option.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
<<<<<<< Updated upstream
=======
        shape: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: ThemeProvider.themeOf(context).data.primaryColor
          )
        ),
>>>>>>> Stashed changes
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: ThemeProvider.themeOf(context).data.primaryColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        title: Text(
          "Настройки",
          style: TextStyle(
            color: ThemeProvider.themeOf(context).data.primaryColor,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: const Column(
        children: [
          ChangeThemeOption()
        ],
      ),
    );
  }
}