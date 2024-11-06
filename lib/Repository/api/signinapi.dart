import 'dart:convert';


import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/SigninModelClass.dart';

import 'api_client.dart';

class Signinapi {
  ApiClient apiClient = ApiClient();

  Future<SigninModelClass> signin(String username,String password) async {
    String trendingpath =
        'http://45.159.221.50:9890/api/signin';
    var body = {

      "email":username,
      "password":password,

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SigninModelClass.fromJson(jsonDecode(response.body));
  }
}