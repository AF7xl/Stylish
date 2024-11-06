import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/getorderapi.dart';
import 'package:stylish/Repository/modelclass/GetorderModelClass.dart';

part 'getorder_event.dart';
part 'getorder_state.dart';

class GetorderBloc extends Bloc<GetorderEvent, GetorderState> {
  late List<GetorderModelClass> getorderModelClass;
  Getorderapi getorderapi=Getorderapi();
  GetorderBloc() : super(GetorderInitial()) {
    on<FetchGetorder>((event, emit) async {
      emit(GetorderStateLoading());
      try{

        getorderModelClass= await getorderapi.Getorder(event.buyid);
        emit(GetorderStateLoaded());
      } catch(e){
        print(e);
        emit(GetorderStateError());}
    });

  }
}
