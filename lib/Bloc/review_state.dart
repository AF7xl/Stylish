part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}
class ReviewStateLoading extends ReviewState{}
class ReviewStateLoaded extends ReviewState{}
class ReviewStateError extends ReviewState{}