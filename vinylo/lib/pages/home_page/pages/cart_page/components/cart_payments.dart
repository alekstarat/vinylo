import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:vinylo/models/cart.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/blocs/cart_bloc/cart_bloc.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/pages/order_page/order_page.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/pages/payments_page/blocs/payment_bloc/payment_bloc.dart';

class CartPayments extends StatefulWidget {
  const CartPayments({super.key});

  @override
  State<CartPayments> createState() => _CartPaymentsState();
}

class _CartPaymentsState extends State<CartPayments> {
  int selectedIndex = 0;
  bool isCardSelected = false;

  void showCards(BuildContext context, String? uid) {
    showModalBottomSheet(
        context: context,
        backgroundColor:
            ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        builder: (context) => StreamBuilder<DocumentSnapshot<Object?>>(
            stream: context.read<DatabaseRepository>().getPayments(uid),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
        
              var list = snapshot.data;
              return Padding(
                padding:
                    const EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount:
                              list != null ? list['cards'].length : 0,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                selectedIndex = 1;
                                Navigator.pop(context);
                                setState(() {});
                              },
                              title: Text(
                                list != null ? list['cards'][index] : "",
                                style: TextStyle(
                                    color: ThemeProvider.themeOf(context)
                                        .data
                                        .primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Ubuntu"),
                              ),
                              leading: Icon(
                                CupertinoIcons.creditcard,
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                              ),
                            );
                          }),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      title: Text(
                        "Добавить новую карту",
                        style: TextStyle(
                            color: ThemeProvider.themeOf(context)
                                .data
                                .primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu"),
                      ),
                      leading: Icon(
                        Icons.add,
                        color: ThemeProvider.themeOf(context)
                            .data
                            .primaryColor,
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
        fontFamily: "Ubuntu",
        color: ThemeProvider.themeOf(context).data.primaryColor,
        fontWeight: FontWeight.bold);
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return StreamBuilder<User?>(
            stream: context.read<AuthenticationBloc>().userRepository.user,
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BlocProvider(
                        create: (context) => PaymentBloc(
                            databaseRepository:
                                context.read<DatabaseRepository>()),
                        child: ListTile(
                          onTap: () {
                            showCards(context, snapshot.data?.uid);
                            if (isCardSelected) {
                              selectedIndex = 1;
                            }
                            setState(() {});
                          },
                          title: Text(
                            "Банковская карта",
                            style: style,
                          ),
                          trailing: selectedIndex == 1
                              ? Icon(
                                  Icons.check,
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .primaryColor,
                                )
                              : null,
                          leading: Icon(
                            CupertinoIcons.creditcard,
                            color: ThemeProvider.themeOf(context)
                                .data
                                .primaryColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          selectedIndex = 2;
                          setState(() {});
                        },
                        title: Text(
                          "Наличными при получении",
                          style: style,
                        ),
                        trailing: selectedIndex == 2
                            ? Icon(
                                Icons.check,
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                              )
                            : null,
                        leading: Icon(
                          CupertinoIcons.money_rubl,
                          color:
                              ThemeProvider.themeOf(context).data.primaryColor,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          selectedIndex = 3;
                          setState(() {});
                        },
                        title: Text(
                          "Наличными курьеру",
                          style: style,
                        ),
                        trailing: selectedIndex == 3
                            ? Icon(
                                Icons.check,
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                              )
                            : null,
                        leading: Icon(
                          CupertinoIcons.cube_box,
                          color:
                              ThemeProvider.themeOf(context).data.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: GestureDetector(
                      onTap: () {
                        if (selectedIndex != 0) {
                          context.read<CartBloc>().add(CartButtonPressedEvent());
                          var order = context.read<CartBloc>().cart;
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(order: order)));
                          context.read<CartModel>().clearCart();
                        }
                        
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 60,
                        decoration: BoxDecoration(
                            color: selectedIndex == 0
                                ? ThemeProvider.themeOf(context)
                                    .data
                                    .secondaryHeaderColor
                                : ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                                width: 2)),
                        child: Center(
                          child: Text("ПРОДОЛЖИТЬ",
                              style: TextStyle(
                                  color: selectedIndex == 0
                                      ? ThemeProvider.themeOf(context)
                                          .data
                                          .primaryColor
                                      : ThemeProvider.themeOf(context)
                                          .data
                                          .secondaryHeaderColor,
                                  fontWeight: selectedIndex == 0
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                  fontFamily: "Ubuntu",
                                  fontSize: 25)),
                        ),
                      ),
                    ),
                  )
                ],
              );
            });
      },
    );
  }
}
