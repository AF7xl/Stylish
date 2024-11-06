import 'dart:convert';

import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/PopularprdctModelClass.dart';

import 'api_client.dart';

class Popularprctapi {
  ApiClient apiClient = ApiClient();

  Future<List<PopularprdctModelClass>> getpopularprdct() async {
    String trendingpath = 'http://45.159.221.50:9890/api/popular-products';
    var body = {};
    Response response =
        await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return PopularprdctModelClass.listFromJson(jsonDecode(response.body));
  }
}
