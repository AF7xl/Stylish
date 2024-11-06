part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupStateLoading extends SignupState{}
class SignupStateLoaded extends SignupState{}
class SignupStateError extends SignupState{}

