import 'package:flutter/material.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/pages/order_page/components/order_tile.dart';

class OrderPage extends StatefulWidget {

  final List<ShopItemModel> order;

  const OrderPage({super.key, required this.order});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  int getTotalCost() {
    int s = 0;
    for (ShopItemModel i in widget.order) {
      s += i.cost;
    }
    return s;
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.order.length; i++) {
      print(widget.order[i].name);
    }
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: 60,
              decoration: BoxDecoration(
                color: ThemeProvider.themeOf(context).data.primaryColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "НА ГЛАВНУЮ",
                    style: TextStyle(
                      color:  ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Ubuntu",
                      fontSize: 25
                    )
                  ),
                  const SizedBox(width: 8,),
                  Icon(Icons.home_rounded, color: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,)
                ],
              ),
            ),
          ),
      backgroundColor: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "ЗАКАЗ ОФОРМЛЕН",
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontFamily: "Ubuntu"
              )
            ),
          ),
          const SizedBox(height: 64,),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "КАССОВЫЙ ЧЕК",
                    style: TextStyle(
                      color: ThemeProvider.themeOf(context).data.primaryColor,
                      fontFamily: "Ubuntu",
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.order.length,
                    itemBuilder: (context, index) => OrderTile(item: widget.order[index],)
                  ),
                ),
                Text(
                  "СУММА:  ${getTotalCost().toDouble()} ₽",
                    style: TextStyle(
                      color: ThemeProvider.themeOf(context).data.primaryColor,
                      fontFamily: "Ubuntu",
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    )
                  ),
                const SizedBox(height: 16,)
              ],
            ),
          ),
          const SizedBox(height: 64,),
          
        ],
      ),
    );
  }
}