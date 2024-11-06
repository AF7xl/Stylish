import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/modelclass/RecommendedprdctModelClass.dart';

import '../Repository/api/recmapi.dart';

part 'rcomndedprdct_event.dart';
part 'rcomndedprdct_state.dart';

class RcomndedprdctBloc extends Bloc<RcomndedprdctEvent, RcomndedprdctState> {
  late List<RecommendedprdctModelClass> recommendedprdctModelClass;
  Recprdctapi recprdctapi = Recprdctapi();
  RcomndedprdctBloc() : super(RcomndedprdctInitial()) {
    on<RcomndedprdctEvent>((event, emit) async {
      emit(RcomndedprdctStateLoading());
      try{

        recommendedprdctModelClass= await recprdctapi.getrecmndedprdct();
        emit(RcomndedprdctStateLoaded());
      } catch(e){
        print(e);
        emit(RcomndedprdctStateError());}
    });
  }
}
