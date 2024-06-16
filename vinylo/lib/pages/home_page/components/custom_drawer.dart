import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/settings_page/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              "Профиль",
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
              )
            ),
            leading: Icon(CupertinoIcons.person_crop_circle, color: ThemeProvider.themeOf(context).data.primaryColor,),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Сообщество",
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
              )
            ),
            leading: Icon(CupertinoIcons.person_add, color: ThemeProvider.themeOf(context).data.primaryColor,),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              "Настройки",
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
              )
            ),
            leading: Icon(CupertinoIcons.settings, color: ThemeProvider.themeOf(context).data.primaryColor,),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: Text(
              "Помощь",
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
              )
            ),
            leading: Icon(CupertinoIcons.question_circle, color: ThemeProvider.themeOf(context).data.primaryColor,),
            onTap: () {},
          ),
          SizedBox(height: MediaQuery.of(context).size. height*0.5,)
        ],
      ),
    );
  }
}