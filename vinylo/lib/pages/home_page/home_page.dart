import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/components/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            style: BorderStyle.solid,
            color: ThemeProvider.themeOf(context).data.primaryColor
          )
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: ThemeProvider.themeOf(context).data.primaryColor,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        backgroundColor: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
             icon: Icon(CupertinoIcons.cart, color: ThemeProvider.themeOf(context).data.primaryColor,)
            )
        ],
        title: Text(
          "VinylO",
          style: TextStyle(
            color: ThemeProvider.themeOf(context).data.primaryColor,
            fontWeight: FontWeight.bold
          )
        ),
      ),
      body: Container()
    );
  }
}