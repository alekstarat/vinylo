import 'package:flutter/material.dart';
import 'package:vinylo/widgets/carousel.dart';
import 'package:vinylo/widgets/popular.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: const Text('Вход/регистрация'),
            onTap: () => Navigator.of(context).pushNamed('/login'),
          ),
          ListTile(
            title: const Text('Каталог'),
            onTap: () => Navigator.of(context).pushNamed('/catalog'),
          ),
          ListTile(
            title: const Text('Настройки'),
            onTap: () => Navigator.of(context).pushNamed('/settings'),
          ),
        ],
      )),
      appBar: AppBar(
        title: const Text('Дискомаркет'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(children: [
        carousel(),
        const Padding(
          padding: EdgeInsets.all(10),
        ),
        const Text(
          'Популярные товары',
          style: TextStyle(fontSize: 25),
        ),
        popular(),
      ]),
    );
  }
}
