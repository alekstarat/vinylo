part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
  
  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

class OrderLoadingState extends OrderState{}

class OrderLoadedState extends OrderState{}
