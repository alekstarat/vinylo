import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:vinylo/models/cart.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/pages/order_page/blocs/order_bloc/order_bloc.dart';
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
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return StreamBuilder(
          stream: context.read<AuthenticationBloc>().userRepository.user,
          builder: (context, snapshotUser) {
            return StreamBuilder<QuerySnapshot<Object?>>(
                stream: context.read<OrderBloc>().databaseRepository.getOrders(snapshotUser.data?.uid),
                builder: (context, snapshot) {
                  
                  return Scaffold(
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.centerFloat,
                    floatingActionButton: GestureDetector(
                      onTap: () {
                        context.read<OrderBloc>().databaseRepository.addOrder(OrderModel(items: context.read<CartModel>().cart), snapshotUser.data?.uid);
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        context.read<CartModel>().clearCart();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 60,
                        decoration: BoxDecoration(
                            color: ThemeProvider.themeOf(context).data.primaryColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("НА ГЛАВНУЮ",
                                style: TextStyle(
                                    color: ThemeProvider.themeOf(context)
                                        .data
                                        .scaffoldBackgroundColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ubuntu",
                                    fontSize: 25)),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.home_rounded,
                              color: ThemeProvider.themeOf(context)
                                  .data
                                  .scaffoldBackgroundColor,
                            )
                          ],
                        ),
                      ),
                    ),
                    backgroundColor:
                        ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text("ЗАКАЗ ОФОРМЛЕН",
                              style: TextStyle(
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  fontFamily: "Ubuntu")),
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          decoration: BoxDecoration(
                              color: ThemeProvider.themeOf(context)
                                  .data
                                  .secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Text("КАССОВЫЙ ЧЕК",
                                    style: TextStyle(
                                        color: ThemeProvider.themeOf(context)
                                            .data
                                            .primaryColor,
                                        fontFamily: "Ubuntu",
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: widget.order.length,
                                    itemBuilder: (context, index) => OrderTile(
                                          item: widget.order[index],
                                        )),
                              ),
                              Text("СУММА:  ${getTotalCost().toDouble()} ₽",
                                  style: TextStyle(
                                      color: ThemeProvider.themeOf(context)
                                          .data
                                          .primaryColor,
                                      fontFamily: "Ubuntu",
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 64,
                        ),
                      ],
                    ),
                  );
                });
          }
        );
      },
    );
  }
}
