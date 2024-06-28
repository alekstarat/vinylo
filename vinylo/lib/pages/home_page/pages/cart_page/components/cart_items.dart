import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/models/cart.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/blocs/cart_bloc/cart_bloc.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        var list = context.read<CartModel>().cart;
        return ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                list[index].artist,
                style: TextStyle(
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",)
              ),
              subtitle: Text(
                list[index].name,
                style: TextStyle(
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",)
              ),
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12)
                ),
                width: 60,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(image: NetworkImage(list[index].image), fit: BoxFit.contain,)),
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
                      context.read<CartBloc>().add(CartItemDeletedEvent(index: index));
                      setState(() {
                        
                      });
                    }, 
                    icon: Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 30
                    )
                  )
                ],
              ),
            );
          }, 
          separatorBuilder:(context, index) => const CustomDivider(), 
          itemCount: list.length
        );
      },
    );
  }
}