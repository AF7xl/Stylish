part of 'getorder_bloc.dart';

@immutable
abstract class GetorderState {}

class GetorderInitial extends GetorderState {}
class GetorderStateLoading extends GetorderState{}
class GetorderStateLoaded extends GetorderState{}
class GetorderStateError extends GetorderState{}