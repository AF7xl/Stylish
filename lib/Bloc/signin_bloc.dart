import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/signinapi.dart';
import 'package:stylish/Repository/modelclass/SigninModelClass.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  late SigninModelClass signinmodelclass;
  Signinapi signinapi = Signinapi();
  SigninBloc() : super(SigninInitial()) {
    on<Fetchsignin>((event, emit) async {
      emit(SigninStateLoading());
      try{

        signinmodelclass= await signinapi.signin(event.username,event.password);
        emit(SigninStateLoaded());
      } catch(e){
        print(e);
        emit(SigninStateError());}
    });
  }
}
