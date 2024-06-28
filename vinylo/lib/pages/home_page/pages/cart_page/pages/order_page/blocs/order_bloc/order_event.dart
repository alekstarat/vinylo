part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderLoadEvent extends OrderEvent{
  final List<ShopItemModel> items;

  const OrderLoadEvent({required this.items});
}