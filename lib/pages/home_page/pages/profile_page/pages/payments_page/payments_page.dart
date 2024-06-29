import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/pages/payments_page/blocs/payment_bloc/payment_bloc.dart';
import 'package:vinylo/pages/home_page/pages/profile_page/pages/payments_page/components/payments_widget.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Способ оплаты",
            style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold)),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PaymentBloc>(
            create: (_) => PaymentBloc(
                databaseRepository: context.read<DatabaseRepository>()),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              userRepository: context.read<AuthenticationBloc>().userRepository
              ),
          ),
        ],
        child: PaymentsWidget(cards: const []),
      ),
    );
  }
}
