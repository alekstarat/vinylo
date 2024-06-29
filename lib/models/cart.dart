import 'package:shop_item_repository/shop_item_repository.dart';

class CartModel{
  List<ShopItemModel> cart;

  CartModel({required this.cart});

  void clearCart() {
    cart = [];
  }
}