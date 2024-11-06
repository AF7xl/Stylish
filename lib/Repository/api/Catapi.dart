import 'dart:convert';


import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/CatModelClass.dart';
import 'package:stylish/Repository/modelclass/CategoriesModelClass.dart';


import 'api_client.dart';

class Catapi {
  ApiClient apiClient = ApiClient();

  Future<List<CatModelClass>> cat(String name) async {
    String trendingpath =
        'http://45.159.221.50:9890/api/products-by-category/$name';
    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return CatModelClass.listFromJson(jsonDecode(response.body));
  }
}
