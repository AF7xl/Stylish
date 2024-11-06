import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/Catapi.dart';
import 'package:stylish/Repository/modelclass/CatModelClass.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  late List<CatModelClass> catmodelclass;
  Catapi catapi=Catapi();
  CatBloc() : super(CatInitial()) {
    on<Fetchcat>((event, emit) async {
      emit(CatStateLoading());
      try{

        catmodelclass= await catapi.cat(event.name);
        emit(CatStateLoaded());
      } catch(e){
        print(e);
        emit(CatStateError());}
    });
  }
}
