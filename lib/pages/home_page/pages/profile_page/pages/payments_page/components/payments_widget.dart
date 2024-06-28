
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';

import 'package:vinylo/pages/home_page/pages/profile_page/pages/payments_page/blocs/payment_bloc/payment_bloc.dart';

// ignore: must_be_immutable
class PaymentsWidget extends StatefulWidget {
  final List<String> cards;
  int selectedIndex = 0;

  PaymentsWidget({super.key, required this.cards});

  @override
  State<PaymentsWidget> createState() => _PaymentsWidgetState();
}

class _PaymentsWidgetState extends State<PaymentsWidget> {
  void _show(BuildContext context, String? uid) {
    showModalBottomSheet(
        isDismissible: false,
        showDragHandle: true,
        backgroundColor:
            ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        context: context,
        builder: (_) => StreamBuilder<DocumentSnapshot<Object?>>(
          stream: context.read<PaymentBloc>().databaseRepository.getPayments(uid),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            var list = snapshot.data;
            print("                                                ");
            return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: ListView.builder(
                          itemCount: list != null ? list['cards'].length : 0,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.pop(context);
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
                            color: ThemeProvider.themeOf(context).data.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Ubuntu"),
                      ),
                      leading: Icon(
                        Icons.add,
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                      ),
                    )
                  ],
                );
          }
        ));
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        widget.selectedIndex = 1;
                        _show(context, snapshot.data?.uid);
                        setState(() {});
                      },
                      title: Text(
                        "Банковская карта",
                        style: style,
                      ),
                      trailing: widget.selectedIndex == 1
                          ? Icon(
                              Icons.check,
                              color:
                                  ThemeProvider.themeOf(context).data.primaryColor,
                            )
                          : null,
                      leading: Icon(
                        CupertinoIcons.creditcard,
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        widget.selectedIndex = 2;
                        setState(() {});
                      },
                      title: Text(
                        "Наличными при получении",
                        style: style,
                      ),
                      trailing: widget.selectedIndex == 2
                          ? Icon(
                              Icons.check,
                              color:
                                  ThemeProvider.themeOf(context).data.primaryColor,
                            )
                          : null,
                      leading: Icon(
                        CupertinoIcons.money_rubl,
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        widget.selectedIndex = 3;
                        setState(() {});
                      },
                      title: Text(
                        "Наличными курьеру",
                        style: style,
                      ),
                      trailing: widget.selectedIndex == 3
                          ? Icon(
                              Icons.check,
                              color:
                                  ThemeProvider.themeOf(context).data.primaryColor,
                            )
                          : null,
                      leading: Icon(
                        CupertinoIcons.cube_box,
                        color: ThemeProvider.themeOf(context).data.primaryColor,
                      ),
                    ),
                  ],
                );
              }
            );
          },
        );
  }
}
