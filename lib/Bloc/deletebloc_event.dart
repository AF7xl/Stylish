part of 'deletebloc_bloc.dart';

@immutable
abstract class DeleteblocEvent {}
class Fetchdelete extends DeleteblocEvent{
  final String buyid;
  Fetchdelete({required this.buyid});
}