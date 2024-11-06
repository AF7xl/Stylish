part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class Fetchsignup extends SignupEvent {
  final String username;
  final String password;
  final String fullname;

  Fetchsignup({
    required this.username,
    required this.password,
    required this.fullname,
  });
}
