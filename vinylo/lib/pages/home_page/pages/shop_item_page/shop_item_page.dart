import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_item_repository/shop_item_repository.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/home_page/components/custom_divider.dart';
import 'package:vinylo/pages/home_page/pages/cart_page/blocs/cart_bloc/cart_bloc.dart';
import 'package:vinylo/pages/home_page/pages/shop_item_page/components/buy_button.dart';
import 'package:vinylo/pages/home_page/pages/shop_item_page/components/rating_stars.dart';
import 'package:vinylo/pages/home_page/pages/shop_item_page/components/toggle_like.dart';

class ShopItemPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
                    child: Image(image: NetworkImage(image)),
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
                          artist,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Ubuntu",
                              fontSize: 25),
                        ),
                        Text(
                          name,
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
                              cost.toInt().toString(),
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
                    RatingStars(rating: rating.toInt()),
                  ],
                ),
              ),
              const CustomDivider(),
              BuyButton(
                onTap: () {
                  context.read<CartBloc>().add(CartItemAddedEvent(item: ShopItemModel(
                    name: name, desc: desc, image: image, cost: cost.toInt(), rating: rating.toInt(), artist: artist)));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
