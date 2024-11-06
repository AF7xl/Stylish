import 'dart:async';
import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylish/Repository/modelclass/OrderModelClass.dart';

import '../Repository/api/orderapi.dart';

part 'order_event.dart';

part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderModelClass orderModelClass;
  Orderapi orderapi = Orderapi();

  OrderBloc() : super(OrderInitial()) {
    on<Fetchorder>((event, emit) async {
      emit(OrderStateLoading());
      try {
        orderModelClass = await orderapi.order(
            event.name,
            event.email,
            event.state,
            event.city,
            event.locality,
            event.prdname,
            event.prdprice,
            event.quantity,
            event.category,
            event.img,
            event.buyid,
            event.vendid);
        emit(OrderStateLoaded());
      } catch (e) {
        print(e);
        emit(OrderStateError());
      }
    });
  }
}
