import 'dart:convert';

import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/UpdateModelClass.dart';

import '../ModelClass/signupmodelclass.dart';
import 'api_client.dart';

class Updateapi {
  ApiClient apiClient = ApiClient();

  Future<UpdateModelClass> update(String state, String locality,String city,String buyid) async {
    String trendingpath = 'http://45.159.221.50:9890/api/users/$buyid';
    var body = {
      "state": state,
      "locality": locality,
      "city": city,

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'PUT', jsonEncode(body));

    return UpdateModelClass.fromJson(jsonDecode(response.body));
  }
}
