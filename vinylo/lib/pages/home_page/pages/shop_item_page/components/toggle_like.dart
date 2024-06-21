import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ToggleLike extends StatefulWidget {

  bool isLiked;

  ToggleLike({super.key, required this.isLiked});

  @override
  State<ToggleLike> createState() => _ToggleLikeState();
}

class _ToggleLikeState extends State<ToggleLike> {

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isLiked = !widget.isLiked;
        });
      },
      child: widget.isLiked ? const Icon(Icons.favorite, color: Colors.red, size: 30,) 
      : const Icon(Icons.favorite_outline, color: Colors.grey, size: 30),
    );
  }
}