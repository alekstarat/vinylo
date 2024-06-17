import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: Icon(Icons.format_list_bulleted),
          itemBuilder: (context) => [
            PopupMenuItem(child: Text('Профиль пользователя')),
            PopupMenuItem(child: Text('Каталог')),
            PopupMenuItem(child: Text('Настройки')),
          ],
        ),
        title: Text('Дискомаркет'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}
