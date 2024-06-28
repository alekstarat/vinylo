import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/models/cart.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/blocs/cart_bloc/cart_bloc.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/components/cart_payments.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/pages/payments_page/blocs/payment_bloc/payment_bloc.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  CartPage({super.key});
  int selectedIndex = 0;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int getTotalCost(BuildContext context) {
    var list = context.read<CartModel>().cart;
    int total = 0;
    for (ShopItemModel i in list) {
      total += i.cost;
    }
    return total;
  }

  void _showPayment(BuildContext context) {
    showModalBottomSheet(
        showDragHandle: true,
        backgroundColor:
            ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        context: context,
        builder: (context) => BlocProvider(
              create: (context) => CartBloc(
                cart: context.read<CartModel>().cart
              ),
              child: const CartPayments(),
            ));
  }

  Widget addButton(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PaymentBloc(databaseRepository: context.read<DatabaseRepository>()),
      child: GestureDetector(
        onTap: () {
          if (getTotalCost(context) != 0) {
            //_show(context, "4AgYzxJxNISoBGdJDNU4bSe7F1r2");
            _showPayment(context);
          }
        },
        child: Container(
            decoration: BoxDecoration(
                color: ThemeProvider.themeOf(context).data.primaryColor,
                borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width * 0.7,
            height: 75,
            child: Center(
              child: getTotalCost(context) > 0
                  ? Text("ОПЛАТИТЬ ${getTotalCost(context)} ₽",
                      style: TextStyle(
                          color: ThemeProvider.themeOf(context)
                              .data
                              .scaffoldBackgroundColor,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 25))
                  : Text(
                      "КОРЗИНА ПУСТА",
                      style: TextStyle(
                          color: ThemeProvider.themeOf(context)
                              .data
                              .scaffoldBackgroundColor,
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocProvider<CartBloc>(
          create: (_) => CartBloc(cart: context.read<CartModel>().cart),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              var list = context.read<CartModel>().cart;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list[index].artist,
                          style: TextStyle(
                            color: ThemeProvider.themeOf(context)
                                .data
                                .primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu",
                          )),
                      subtitle: Text(list[index].name,
                          style: TextStyle(
                            color: ThemeProvider.themeOf(context)
                                .data
                                .primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu",
                          )),
                      leading: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: NetworkImage(list[index].image),
                              fit: BoxFit.contain,
                            )),
                      ),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                list[index].cost.toString(),
                                style: TextStyle(
                                    color: ThemeProvider.themeOf(context)
                                        .data
                                        .primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ubuntu",
                                    fontSize: 20),
                              ),
                              Text(
                                "₽",
                                style: TextStyle(
                                    color: ThemeProvider.themeOf(context)
                                        .data
                                        .primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ubuntu",
                                    fontSize: 20),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartItemDeletedEvent(index: index));
                                setState(() {});
                              },
                              icon: const Icon(Icons.delete,
                                  color: Colors.grey, size: 30))
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const CustomDivider(),
                  itemCount: list.length);
            },
          ),
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
        floatingActionButton: BlocProvider<PaymentBloc>(
          create: (context) => PaymentBloc(
              databaseRepository: context.read<DatabaseRepository>()),
          child: addButton(context),
        ));
  }
}
