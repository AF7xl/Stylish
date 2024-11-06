part of 'deletebloc_bloc.dart';

@immutable
abstract class DeleteblocState {}

class DeleteblocInitial extends DeleteblocState {}
class DeleteStateLoading extends DeleteblocState{}
class DeleteStateLoaded extends DeleteblocState{}
class DeleteStateError extends DeleteblocState{}