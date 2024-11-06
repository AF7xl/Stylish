part of 'update_bloc.dart';

@immutable
abstract class UpdateState {}

class UpdateInitial extends UpdateState {}
class UpdateStateLoading extends UpdateState{}
class UpdateStateLoaded extends UpdateState{}
class UpdateStateError extends UpdateState{}