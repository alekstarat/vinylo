import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/components/shop_item/shop_item.dart';

class HorizontalScrollList extends StatelessWidget {
  final String categoryName;
  final List<ShopItem> list;
  const HorizontalScrollList({super.key, required this.categoryName, required this.list});

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
                categoryName,
                style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              
              Icon(Icons.keyboard_arrow_right, color:  ThemeProvider.themeOf(context).data.primaryColor,)
               
            ],
          ),
        ),
        SizedBox(
          height: 270,
          width: double.infinity,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int i) {
              return list[i];
            }, 
            separatorBuilder: (context, index) => const SizedBox(width: 16,),
            itemCount: list.length
          ),
        )
      ],
    );
  }
}