import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/ModelClass/signupmodelclass.dart';
import 'package:stylish/Repository/api/signupapi.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late SignupModelClass signupmodelclass;
  Signupapi signupapi = Signupapi();

  SignupBloc() : super(SignupInitial()) {
    on<Fetchsignup>((event, emit) async {
      emit(SignupStateLoading());
      try {
        signupmodelclass = await signupapi.signup(
            event.username, event.password, event.fullname);
        emit(SignupStateLoaded());
      } catch (e) {
        print(e);
        emit(SignupStateError());
      }
    });
  }
}
