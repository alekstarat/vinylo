import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/login_page/login_page.dart';
import 'package:vinylo/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final themeManager = ThemeManager();

    return Provider<ThemeManager>.value(
      value: themeManager,
      child: ThemeProvider(
        themes: themeManager.themes,
        child: ThemeConsumer(
          child: Builder(
            builder: (themeContext) => MaterialApp(
              theme: ThemeProvider.themeOf(themeContext).data,
                debugShowCheckedModeBanner: false,
                home: const LoginPage()
              )
          ),
        ),
      ),
    );
  }
}