import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_item_repository/shop_item_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {

  List<ShopItemModel> cart;

  CartBloc({
    required this.cart
  }) : super(CartCollecting()) {
    on<CartItemAddedEvent>((event, emit) {
        cart.add(event.item);
        print("Item added to cart");
        print(cart.length);
    });
    on<CartItemDeletedEvent>((event, emit) {
      cart.removeAt(event.index);
    });
  }
}
