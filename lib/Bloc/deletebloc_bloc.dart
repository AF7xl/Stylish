import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/delete%20api.dart';
import 'package:stylish/Repository/modelclass/DeleteModelClass.dart';

part 'deletebloc_event.dart';
part 'deletebloc_state.dart';

class DeleteblocBloc extends Bloc<DeleteblocEvent, DeleteblocState> {
  late DeleteModelClass deleteModelClass;
  Deleteapi deleteapi=Deleteapi();
  DeleteblocBloc() : super(DeleteblocInitial()) {
    on<Fetchdelete>((event, emit) async {
      emit(DeleteStateLoading());
      try{

        deleteModelClass= await deleteapi.delete(event.buyid);
        emit(DeleteStateLoaded());
      } catch(e){
        print(e);
        emit(DeleteStateError());}
    });

  }
}
