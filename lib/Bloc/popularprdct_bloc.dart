import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/popularprctapi.dart';
import 'package:stylish/Repository/modelclass/PopularprdctModelClass.dart';

part 'popularprdct_event.dart';
part 'popularprdct_state.dart';

class PopularprdctBloc extends Bloc<PopularprdctEvent, PopularprdctState> {
  late List<PopularprdctModelClass> popularprdctModelClass;
  Popularprctapi popularprctapi = Popularprctapi();
  PopularprdctBloc() : super(PopularprdctInitial()) {
    on<PopularprdctEvent>((event, emit) async {
      emit(PopularprdctStateLoading());
      try{

        popularprdctModelClass= await popularprctapi.getpopularprdct();
        emit(PopularprdctStateLoaded());
      } catch(e){
        print(e);
        emit(PopularprdctStateError());}
    });
  }
}
