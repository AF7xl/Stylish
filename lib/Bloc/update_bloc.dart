import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/modelclass/UpdateModelClass.dart';

import '../Repository/api/updateapi.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  late UpdateModelClass updateModelClass;
  Updateapi updateapi = Updateapi();
  UpdateBloc() : super(UpdateInitial()) {
    on<FetchUpdate>((event, emit) async {
      emit(UpdateStateLoading());
      try {
        updateModelClass = await updateapi.update(
          event.state, event.locality,event.city, event.buyid );
        emit(UpdateStateLoaded());
      } catch (e) {
        print(e);
        emit(UpdateStateError());
      }
    });
  }
}
