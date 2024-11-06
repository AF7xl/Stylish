import 'dart:convert';

import 'package:http/http.dart';

import '../ModelClass/signupmodelclass.dart';
import 'api_client.dart';

class Signupapi {
  ApiClient apiClient = ApiClient();

  Future<SignupModelClass> signup(String username, String password,String fullname) async {
    String trendingpath = 'http://45.159.221.50:9890/api/signup';
    var body = {
      "fullName": fullname,
      "email": username,
      "password": password,

    };
    Response response =
        await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    return SignupModelClass.fromJson(jsonDecode(response.body));
  }
}
