
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ShopItemPhoto extends StatefulWidget {

  final String image;

  const ShopItemPhoto({super.key, required this.image});

  @override
  State<ShopItemPhoto> createState() => _ShopItemPhotoState();
}

class _ShopItemPhotoState extends State<ShopItemPhoto> {

  @override  
  void didChangeDependencies() {
    
    super.didChangeDependencies();
    precacheImage(CachedNetworkImageProvider(widget.image), context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.37,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl:  widget.image,
          placeholder: (context, url) => CircularProgressIndicator(color: ThemeProvider.themeOf(context).data.secondaryHeaderColor, strokeWidth: 2,),
        )
      ),
    );
  }
}