part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

class BannerInitial extends BannerState {}
class BannerStateLoading extends BannerState{}
class BannerStateLoaded extends BannerState{}
class BannerStateError extends BannerState{}