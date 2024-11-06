import 'dart:convert';


import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/CategoriesModelClass.dart';
import 'package:stylish/Repository/modelclass/GetorderModelClass.dart';


import 'api_client.dart';

class Getorderapi {
  ApiClient apiClient = ApiClient();

  Future<List<GetorderModelClass>> Getorder(String buyid) async {
    String trendingpath =
        'http://45.159.221.50:9890/api/orders/$buyid';
    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return GetorderModelClass.listFromJson(jsonDecode(response.body));
  }
}
