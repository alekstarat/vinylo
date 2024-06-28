import 'package:flutter/material.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';

class OrderTile extends StatelessWidget {

  final ShopItemModel item;

  const OrderTile({super.key, required this.item});

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 45,
                  height: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(image: NetworkImage(item.image), fit: BoxFit.contain,),
                  ),
                ),
                const SizedBox(width: 8,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.artist,
                      style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor.withOpacity(0.3),
                        fontSize: 20,
                        fontFamily: "Ubuntu"
                      )
                    ),
                    Text(
                      item.name,
                      style: TextStyle(
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                        fontSize: 20,
                        fontFamily: "Ubuntu",
                        fontWeight: FontWeight.bold
                      )
                    )
                  ],
                ),
              ],
            ),
            
            Text(
              item.cost.toDouble().toString(),
              style: TextStyle(
                    color: ThemeProvider.themeOf(context).data.primaryColor,
                    fontSize: 20,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold
                  )
            )
          ],
        ),
      ),
    );
  }
}