import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeManager {

  bool isDarkmodeOn = false;
  bool get isDark => isDarkmodeOn;
  set isDark(bool val) => val; 

  final List<AppTheme> themes = [
    AppTheme(
      id: 'light', 
      description: "Light Theme",
      data: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: Colors.grey.shade300,
        focusColor: Colors.blueAccent
      ),
    ),
    AppTheme(
      id: 'dark', 
      description: "Dark Theme",
      data: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        secondaryHeaderColor: Colors.grey.shade900,
        focusColor: Colors.blueAccent
      ), 
    )
  ];

  Future<void> changeTheme(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isDarkmodeOn) {
      ThemeProvider.controllerOf(context).setTheme("light");
      isDarkmodeOn = false;
      await prefs.setBool("isDarkmodeOn", false);
    } else {
      ThemeProvider.controllerOf(context).setTheme("dark");
      isDarkmodeOn = true;
      await prefs.setBool("isDarkmodeOn", true);
    }
  }
}