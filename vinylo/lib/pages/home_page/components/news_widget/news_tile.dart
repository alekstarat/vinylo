import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class NewsTile extends StatelessWidget {

  final String? name, desc;
  final String? date;

  const NewsTile({super.key, required this.name, required this.desc, this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      decoration: BoxDecoration(
        color: ThemeProvider.themeOf(context).data.secondaryHeaderColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name.toString(),
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            Text(
              desc.toString(),
              style: TextStyle(
                color: ThemeProvider.themeOf(context).data.primaryColor,
                fontFamily: "Ubuntu",
                fontSize: 10
              ),
            ),
            if (date != "") 
              Text(
                date.toString(),
                style: TextStyle(
                  color: ThemeProvider.themeOf(context).data.primaryColor.withOpacity(0.7),
                  fontFamily: "Ubuntu",
                  fontSize: 10
                ),
              ),
          ],
        ),
      ),
    );
  }
}