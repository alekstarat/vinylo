import 'package:flutter/material.dart';
import 'package:vinylo/router.dart';
import 'package:vinylo/theme.dart';

class Vinylo extends StatelessWidget {
  const Vinylo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Магазин Пластинок',
      routes: routes,
    );
  }
}
