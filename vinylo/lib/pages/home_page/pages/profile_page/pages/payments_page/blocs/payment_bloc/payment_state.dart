part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  
  @override
  List<Object> get props => [];
}

final class PaymentInitial extends PaymentState {}

class PaymentLoading extends PaymentState{}
class PaymentLoaded extends PaymentState{
  final Stream<QuerySnapshot<Object?>> payments;

  const PaymentLoaded(this.payments);
}

class PaymentLoadFailure extends PaymentState {
  final String? message;

  const PaymentLoadFailure({required this.message});
}
