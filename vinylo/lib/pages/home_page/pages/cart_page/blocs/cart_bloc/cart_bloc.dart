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
      if (!cart.contains(event.item)) {
        cart.add(event.item);
        print("Item added to cart");
        print(cart.length);
      } else {
        print("Item already in cart");
      }
    });
    on<CartItemDeletedEvent>((event, emit) {
      cart.removeAt(event.index);
    });
    on<CartButtonPressedEvent>((event, emit) {
      emit(CartReady(items: cart));
      print("cart ready");
    });
  }
}
