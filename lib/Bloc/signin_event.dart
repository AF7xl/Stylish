part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}
class Fetchsignin extends SigninEvent {
  final String username;

  final String password;

  Fetchsignin({
    required this.username,
    required this.password,
  });
}
