import 'package:flutter/cupertino.dart';
import 'package:theme_provider/theme_provider.dart';

// ignore: must_be_immutable
class BuyButton extends StatefulWidget {

  Function? onTap;
  
  BuyButton({super.key, required this.onTap});

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap:() => widget.onTap!(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color:
                                ThemeProvider.themeOf(context).data.primaryColor,
                            width: 2),
                        color: ThemeProvider.themeOf(context)
                            .data
                            .scaffoldBackgroundColor),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "КУПИТЬ",
                            style: TextStyle(
                                color: ThemeProvider.themeOf(context)
                                    .data
                                    .primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ubuntu",
                                fontSize: 30),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Icon(CupertinoIcons.cart,
                              color: ThemeProvider.themeOf(context)
                                  .data
                                  .primaryColor,
                              size: 30)
                        ],
                      ),
                    ),
                  ),
                ),
              );
  }
}