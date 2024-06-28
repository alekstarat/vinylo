part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartItemAddedEvent extends CartEvent{
  final ShopItemModel item;
  const CartItemAddedEvent({required this.item});
}

class CartItemDeletedEvent extends CartEvent{
  final int index;
  const CartItemDeletedEvent({required this.index});
}

class CartButtonPressedEvent extends CartEvent{

}

