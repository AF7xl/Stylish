part of 'rcomndedprdct_bloc.dart';

@immutable
abstract class RcomndedprdctState {}

class RcomndedprdctInitial extends RcomndedprdctState {}
class RcomndedprdctStateLoading extends RcomndedprdctState{}
class RcomndedprdctStateLoaded extends RcomndedprdctState{}
class RcomndedprdctStateError extends RcomndedprdctState{}