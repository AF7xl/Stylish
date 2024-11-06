part of 'cat_bloc.dart';

@immutable
abstract class CatEvent {}
class Fetchcat extends CatEvent{
  final String name;
  Fetchcat({required this.name});
}