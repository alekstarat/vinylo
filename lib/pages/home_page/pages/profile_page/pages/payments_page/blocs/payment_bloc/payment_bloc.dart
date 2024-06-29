import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_item_repository/shop_item_repository.dart';


part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {

  final DatabaseRepository databaseRepository;

  PaymentBloc({
    required this.databaseRepository
  }) : super(PaymentLoading()) {
    on<LoadPaymentEvent>((event, emit) {
      try {
        emit(PaymentLoaded(databaseRepository.getItems()));
      } catch (e) {
        emit(PaymentLoadFailure(message: e.toString()));
      }
    });
  }
}
