import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/api/categoriesapi.dart';
import 'package:stylish/Repository/modelclass/CategoriesModelClass.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  late List<CategoriesModelClass> categoriesModelClass;
  Categoriesapi categoriesapi = Categoriesapi();
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      emit(CategoriesStateLoading());
      try{

        categoriesModelClass= await categoriesapi.getCategories();
        emit(CategoriesStateLoaded());
      } catch(e){
        print(e);
        emit(CategoriesStateError());}
    });
  }
}
