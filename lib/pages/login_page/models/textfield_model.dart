import 'package:flutter/material.dart';

class TextfieldModel{

  final String hint;
  final bool obscure;
  bool isObscured;

  set obscure(bool obs) => obs;

  TextEditingController get controller => _controller;

  TextfieldModel({
    this.hint = "", 
    this.obscure = false,
    this.isObscured = false,
  });

  final _controller = TextEditingController();

  void changeVisibility() {
    if (_controller.text != "") {isObscured = !isObscured;}
  }
}