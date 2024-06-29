import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/components/news_widget/news_tile.dart';

class NewsWidget extends StatelessWidget {

  final List<Map<String, String>> list = [
    {
      "name" : "Итоги марта",
      "desc" : "Пришло время подвести итоги работы площадки за март.",
      "date" : "01 апреля 2024"
    },
    {
      "name" : "Record Store Day Online",
      "desc" : "Онлайн - мероприятие",
      "date" : "18 мая 2024"
    },
    {
      "name" : "Итоги мая",
      "desc" : "Уважаемые пользователи! Сообщаем вам итоги работы приложения за май 2024 года. На сайте зарегистрировано 4795 пользователе...",
      "date" : "01 июня 2024"
    },
  ];

  NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'НОВОСТИ VINYLO',
                style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  fontSize: 20,     
                  fontFamily: "Ubuntu"
                )
              ),
              Icon(Icons.keyboard_arrow_right, color:  ThemeProvider.themeOf(context).data.primaryColor,)
            ],
          ),
        ),
        SizedBox(
          height: 130,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 32),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: list.length,
            itemBuilder: (context, index) => NewsTile(
              name: list[index]['name'],
              desc: list[index]['desc'],
              date: list[index]['date']
            )
          ),
        )
      ],
    );
  }
}