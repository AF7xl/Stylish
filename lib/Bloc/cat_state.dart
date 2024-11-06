part of 'cat_bloc.dart';

@immutable
abstract class CatState {}

class CatInitial extends CatState {}
class CatStateLoading extends CatState{}
class CatStateLoaded extends CatState{}
class CatStateError extends CatState{}