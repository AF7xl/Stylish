import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/reviewapi.dart';

import '../Repository/modelclass/ReviewModelClass.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  late List<ReviewModelClass> reviewmodelclass;
  Reviewapi reviewapi = Reviewapi();
  ReviewBloc() : super(ReviewInitial()) {
    on<ReviewEvent>((event, emit) async {
      emit(ReviewStateLoading());
      try{

        reviewmodelclass= await reviewapi.getreview();
        emit(ReviewStateLoaded());
      } catch(e){
        print(e);
        emit(ReviewStateError());}
    });
  }
}
