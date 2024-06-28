import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class RatingStars extends StatelessWidget {

  final int rating;

  const RatingStars({super.key, required this.rating});

  List<Icon> getList() {
    List<Icon> list = [];
    for (int i = 0; i < rating; i++) {
      list.add(const Icon(Icons.star, color: Colors.yellow, size: 35));
    }
    for (int i = 0; i < (5 - rating); i++) {
      list.add(const Icon(Icons.star_outline, color: Colors.grey, size: 35));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> list = getList();
    return Column(
      children: [
        Text(
          "Рейтинг продавца",
          style: TextStyle(
            color: ThemeProvider.themeOf(context).data.primaryColor,
            fontFamily: "Ubuntu",
            fontSize: 22
          )
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: list,
        )
      ],
    );
  }
}