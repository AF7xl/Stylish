import 'dart:convert';


import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/CategoriesModelClass.dart';


import 'api_client.dart';

class Categoriesapi {
  ApiClient apiClient = ApiClient();

  Future<List<CategoriesModelClass>> getCategories() async {
    String trendingpath =
        'http://45.159.221.50:9890/api/categories';
    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return CategoriesModelClass.listFromJson(jsonDecode(response.body));
  }
}
