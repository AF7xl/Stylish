part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesStateLoading extends CategoriesState{}
class CategoriesStateLoaded extends CategoriesState{}
class CategoriesStateError extends CategoriesState{}