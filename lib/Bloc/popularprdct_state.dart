part of 'popularprdct_bloc.dart';

@immutable
abstract class PopularprdctState {}

class PopularprdctInitial extends PopularprdctState {}
class PopularprdctStateLoading extends PopularprdctState{}
class PopularprdctStateLoaded extends PopularprdctState{}
class PopularprdctStateError extends PopularprdctState{}