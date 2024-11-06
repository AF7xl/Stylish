part of 'getorder_bloc.dart';

@immutable
abstract class GetorderEvent {}
class FetchGetorder extends GetorderEvent{
  final String buyid;
  FetchGetorder({required this.buyid});
}