import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/bannerapi.dart';
import 'package:stylish/Repository/modelclass/BannerModelClass.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  late List<BannerModelClass> bannerModelClass;
  Bannerapi bannerapi=Bannerapi();
  BannerBloc() : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      emit(BannerStateLoading());
      try{

        bannerModelClass= await bannerapi.getBanner();
        emit(BannerStateLoaded());
      } catch(e){
        print(e);
        emit(BannerStateError());}
    });
  }
}
