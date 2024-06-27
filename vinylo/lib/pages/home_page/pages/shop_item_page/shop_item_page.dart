import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/models/cart.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/blocs/cart_bloc/cart_bloc.dart';
import 'package:vinylo/pages/home_page/pages/shop_item_page/components/rating_stars.dart';
import 'package:vinylo/pages/home_page/pages/shop_item_page/components/toggle_like.dart';

class ShopItemPage extends StatefulWidget {
  final String id, name, artist, desc, image;
  final double cost, rating;

  

  const ShopItemPage(
      {super.key,
      required this.id,
      required this.name,
      required this.artist,
      required this.desc,
      required this.image,
      required this.cost,
      required this.rating});

  @override
  State<ShopItemPage> createState() => _ShopItemPageState();
}

class _ShopItemPageState extends State<ShopItemPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        var list = context.read<CartModel>().cart;
        
        bool isPressed = list.contains(
          ShopItemModel(
            name: widget.name,
            artist: widget.artist,
            desc: widget.desc,
            image: widget.image,
            cost: widget.cost.toInt(),
            rating: widget.rating.toInt()
          )
        ) ? true : false;
        return Scaffold(
          appBar: AppBar(
            shape: Border(
                bottom: BorderSide(
                    style: BorderStyle.solid,
                    color: ThemeProvider.themeOf(context).data.primaryColor)),
            backgroundColor:
                ThemeProvider.themeOf(context).data.secondaryHeaderColor,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: ThemeProvider.themeOf(context).data.primaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: GestureDetector(
            onTap: () {
              if (!isPressed) {
                context.read<CartBloc>().add(CartItemAddedEvent(item: ShopItemModel(
                  name: widget.name, desc: widget.desc, image: widget.image, cost: widget.cost.toInt(), rating: widget.rating.toInt(), artist: widget.artist)));
              } else {
                context.read<CartBloc>().add(CartItemDeletedEvent(
                  index: list.indexOf(ShopItemModel(
                  name: widget.name, desc: widget.desc, image: widget.image, cost: widget.cost.toInt(), rating: widget.rating.toInt(), artist: widget.artist))
                  )
                );
              }
              setState(() {
                
              });
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width*0.9,
                height: 90,
                decoration: BoxDecoration(
                  color: isPressed ? ThemeProvider.themeOf(context).data.scaffoldBackgroundColor : ThemeProvider.themeOf(context).data.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isPressed ? ThemeProvider.themeOf(context).data.primaryColor : ThemeProvider.themeOf(context).data.scaffoldBackgroundColor,
                    width: 2
                  )
                ),
                child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              isPressed ? "В КОРЗИНЕ" : "КУПИТЬ",
                              style: TextStyle(
                                  color: isPressed ? ThemeProvider.themeOf(context).data.primaryColor : ThemeProvider.themeOf(context)
                                      .data
                                      .scaffoldBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",
                                  fontSize: 30),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Icon(isPressed ? CupertinoIcons.check_mark : CupertinoIcons.cart,
                                color: isPressed ? ThemeProvider.themeOf(context).data.primaryColor : ThemeProvider.themeOf(context)
                                      .data
                                      .scaffoldBackgroundColor,
                                size: 30)
                          ],
                        ),
                      ),
              ),
          ), 
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: ThemeProvider.themeOf(context)
                              .data
                              .secondaryHeaderColor,
                          width: 2)),
                  height: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(image: NetworkImage(widget.image)),
                  ),
                )),
              ),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.artist,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu",
                              fontSize: 25),
                        ),
                        Text(
                          widget.name,
                          style: TextStyle(
                              color: ThemeProvider.themeOf(context)
                                  .data
                                  .primaryColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu",
                              fontSize: 35),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.cost.toInt().toString(),
                              style: TextStyle(
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",
                                  fontSize: 35),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              "₽",
                              style: TextStyle(
                                  color: ThemeProvider.themeOf(context)
                                      .data
                                      .primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Ubuntu",
                                  fontSize: 35),
                            )
                          ],
                        ),
                        ToggleLike(
                          isLiked: true,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RatingStars(rating: widget.rating.toInt()),
                  ],
                ),
              ),
              const CustomDivider(),
            ],
          ),
        );
      },
    );
  }
}
