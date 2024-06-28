import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/pages/history_page/components/history_page_view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(
                style: BorderStyle.solid,
                color: ThemeProvider.themeOf(context).data.primaryColor)),
                backgroundColor:
                    ThemeProvider.themeOf(context).data.secondaryHeaderColor,
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Text("История заказов",
                    style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold)),
              ),
              body: const HistoryPageView(),
            );
  }
}