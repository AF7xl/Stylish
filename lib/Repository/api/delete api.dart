import 'dart:convert';

import 'package:http/http.dart';

import 'package:stylish/Repository/modelclass/DeleteModelClass.dart';

import 'api_client.dart';

class Deleteapi {
  ApiClient apiClient = ApiClient();

  Future<DeleteModelClass> delete(String buyid) async {
    String trendingpath = 'http://45.159.221.50:9890/api/orders/$buyid';
    var body = {};
    Response response =
        await apiClient.invokeAPI(trendingpath, 'DELETE', jsonEncode(body));

    return DeleteModelClass.fromJson(jsonDecode(response.body));
  }
}
