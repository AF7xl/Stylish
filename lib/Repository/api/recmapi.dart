import 'dart:convert';


import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/PopularprdctModelClass.dart';
import 'package:stylish/Repository/modelclass/RecommendedprdctModelClass.dart';



import 'api_client.dart';

class Recprdctapi {
  ApiClient apiClient = ApiClient();

  Future<List<RecommendedprdctModelClass> >getrecmndedprdct() async {
    String trendingpath =
        'http://45.159.221.50:9890/api/recommended-products';
    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return RecommendedprdctModelClass.listFromJson(jsonDecode(response.body));
  }
}
