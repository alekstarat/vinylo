import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_item_repository/shop_item_repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderLoadEvent>((event, emit) async {
      emit(OrderLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      emit(OrderLoadedState());
    });
  }
}
