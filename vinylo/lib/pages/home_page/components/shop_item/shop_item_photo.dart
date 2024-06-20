import 'package:flutter/material.dart';

class ShopItemPhoto extends StatelessWidget {

  final String image;

  const ShopItemPhoto({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          image, 
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}