part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  
  @override
  List<Object> get props => [];
}

class CartCollecting extends CartState {
  final List<ShopItemModel> items = [];
}

class CartReady extends CartState{
  final List<ShopItemModel> items;

  const CartReady({required this.items});
}