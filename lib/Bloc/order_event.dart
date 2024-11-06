part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}

class Fetchorder extends OrderEvent {
  final String name;
  final String email;
  final String state;
  final String city;
  final String locality;

  final String prdname;
  final String prdprice;
  final String quantity;
  final String category;
  final String img;

  final String buyid;
  final String vendid;

  Fetchorder({
    required this.name,
    required this.email,
    required this.state,
    required this.city,
    required this.locality,
    required this.prdname,
    required this.prdprice,
    required this.quantity,
    required this.category,
    required this.img,
    required this.buyid,
    required this.vendid,
  });
}
