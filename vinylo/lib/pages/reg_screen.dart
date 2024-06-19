import 'package:flutter/material.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegistrationState();
}

class _RegistrationState extends State<RegScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Вход/регистрация')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              const Regis(),
              const Padding(padding: EdgeInsets.all(10)),
              TextButton(
                onPressed: () {},
                child: const Text('Войти'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Зарегистрироваться'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Regis extends StatelessWidget {
  const Regis({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 250,
      child: Column(
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Имя пользователя',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Пароль',
            ),
          ),
        ],
      ),
    );
  }
}
