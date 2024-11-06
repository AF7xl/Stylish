import 'dart:convert';


import 'package:http/http.dart';
import 'package:stylish/Repository/modelclass/BannerModelClass.dart';


import 'api_client.dart';

class Bannerapi {
  ApiClient apiClient = ApiClient();

  Future<List<BannerModelClass>> getBanner() async {
    String trendingpath =
        'http://45.159.221.50:9890/api/banner';
    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return BannerModelClass.listFromJson(jsonDecode(response.body));
  }
}
