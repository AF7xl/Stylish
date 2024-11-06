part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderStateLoading extends OrderState{}
class OrderStateLoaded extends OrderState{}
class OrderStateError extends OrderState{}