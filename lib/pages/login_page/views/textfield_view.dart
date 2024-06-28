import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:vinylo/pages/login_page/models/textfield_model.dart';

class TextfieldView extends StatefulWidget {

  final TextfieldModel model;

  const TextfieldView({super.key, required this.model});

  @override
  State<TextfieldView> createState() => _TextfieldViewState();
}

class _TextfieldViewState extends State<TextfieldView> {

  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      height: kToolbarHeight,
      child: TextFormField(
        obscureText: widget.model.isObscured,
        textAlignVertical: TextAlignVertical.center,
        cursorWidth: 1,
        controller: widget.model.controller,
        style: TextStyle(
          color: ThemeProvider.themeOf(context).data.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        
        ),
        
        cursorColor: ThemeProvider.themeOf(context).data.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeProvider.themeOf(context).data.primaryColor,
            ),
            
          ),
          hintStyle: TextStyle(
            color: ThemeProvider.themeOf(context).data.primaryColor
          ),
          suffix: widget.model.obscure ? IconButton(
            onPressed: () {
              widget.model.changeVisibility();
              setState(() {});
            }, 
            icon: Icon(
              CupertinoIcons.eye, 
              color: ThemeProvider.themeOf(context).data.primaryColor,),
              iconSize: 25,
            ) : null,
          hintText: widget.model.hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeProvider.themeOf(context).data.primaryColor,
            )
          ),
          fillColor: Colors.white
        ),
      ),
    );
  }
}