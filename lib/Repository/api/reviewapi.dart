import 'dart:convert';

import 'package:http/http.dart';

import '../modelclass/ReviewModelClass.dart';
import 'api_client.dart';

class Reviewapi {
  ApiClient apiClient = ApiClient();

  Future<List<ReviewModelClass>> getreview() async {
    String trendingpath = 'http://45.159.221.50:9890/api/product-reviews';
    var body = {};
    Response response =
        await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return ReviewModelClass.listFromJson(jsonDecode(response.body));
  }
}
