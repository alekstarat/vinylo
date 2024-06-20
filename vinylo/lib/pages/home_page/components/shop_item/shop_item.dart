import 'package:flutter/cupertino.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/components/shop_item/shop_item_photo.dart';

class ShopItem extends StatelessWidget {

  final String id, name, artist, desc, image;
  final double cost;

  const ShopItem({super.key, required this.id, required this.name, required this.artist,required this.desc, required this.image, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ThemeProvider.themeOf(context).data.secondaryHeaderColor
      ),
      width: MediaQuery.of(context).size.width*0.37,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: id, 
              child: ShopItemPhoto(image: image,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      artist,
                      style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                        fontSize: 11
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Рейтинг продавца:",
                      style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                        fontSize: 9,
                        fontFamily: "Ubuntu"
                      ),
                    )
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(CupertinoIcons.star, size: 16, color: ThemeProvider.themeOf(context).data.primaryColor,), 
                    Icon(CupertinoIcons.star, size: 16, color: ThemeProvider.themeOf(context).data.primaryColor,),
                    Icon(CupertinoIcons.star, size: 16, color: ThemeProvider.themeOf(context).data.primaryColor,),
                    Icon(CupertinoIcons.star, size: 16, color: ThemeProvider.themeOf(context).data.primaryColor,),
                    Icon(CupertinoIcons.star, size: 16, color: ThemeProvider.themeOf(context).data.primaryColor,),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: Text(
                          cost.toInt().toString(),
                          style: TextStyle(
                            color: ThemeProvider.themeOf(context).data.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),
                        ),
                      ),
                      Text(
                        "₽",
                        style: TextStyle(
                          color: ThemeProvider.themeOf(context).data.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}