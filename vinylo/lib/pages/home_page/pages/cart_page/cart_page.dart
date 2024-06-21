import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/blocs/cart_bloc/cart_bloc.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/components/cart_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  int getTotalCost(BuildContext context) {
    var list = context.read<List<ShopItemModel>>();
    int total = 0;
    for (ShopItemModel i in list) {
      total += i.cost;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BlocProvider<CartBloc>(
          create: (_) => CartBloc(
            cart: context.read<List<ShopItemModel>>()
          ),
          child: const CartItems(),
        ),
      appBar: AppBar(
          shape: Border(
              bottom: BorderSide(
                  style: BorderStyle.solid,
                  color: ThemeProvider.themeOf(context).data.primaryColor)),
          backgroundColor:
              ThemeProvider.themeOf(context).data.secondaryHeaderColor,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ThemeProvider.themeOf(context).data.primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Корзина",
              style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor,
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold)),
        ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width*0.7,
        height: 75,
        decoration: BoxDecoration(
          color: ThemeProvider.themeOf(context).data.primaryColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: getTotalCost(context) > 0 ? Text(
            "ОПЛАТИТЬ ${getTotalCost(context)} ₽",
            style: TextStyle(
                    color: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  )
          ) : Text(
            "КОРЗИНА ПУСТА",
            style: TextStyle(
                    color: ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                    fontSize: 25
            ),
        ),
      )
    )
  );}
}
