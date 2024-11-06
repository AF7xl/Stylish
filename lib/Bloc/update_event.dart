part of 'update_bloc.dart';

@immutable
abstract class UpdateEvent {}

class FetchUpdate extends UpdateEvent {
  final String buyid;
  final String state;
  final String locality;
  final String city;

  FetchUpdate(
      {required this.buyid,
      required this.state,
      required this.locality,
      required this.city});
}
