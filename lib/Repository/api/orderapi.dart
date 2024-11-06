import 'dart:convert';

import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/OrderModelClass.dart';
import 'package:stylish/Repository/modelclass/SigninModelClass.dart';

import 'api_client.dart';

class Orderapi {
  ApiClient apiClient = ApiClient();

  Future<OrderModelClass> order(
      String name,
      String email,
      String state,
      String city,
      String locality,
      String prdname,
      String prdprice,
      String quantity,
      String category,
      String img,
      String buyid,
      String Vendid) async {
    String trendingpath = 'http://45.159.221.50:9890/api/orders';
    var body = {
      "fullName": name,
      "email": email,
      "state": state,
      "city": city,
      "locality": locality,
      "productName": prdname,
      "productPrice": prdprice,
      "quantity": quantity,
      "category": category,
      "image": img,
      "buyerId": buyid,
      "vendorId": Vendid
    };
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return OrderModelClass.fromJson(jsonDecode(response.body));
  }
}
