part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}
class SigninStateLoading extends SigninState{}
class SigninStateLoaded extends SigninState{}
class SigninStateError extends SigninState{}
