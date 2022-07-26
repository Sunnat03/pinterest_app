import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../models/pinterset_models.dart';

class Network{
  static const String URL = 'api.unsplash.com';

  static String API_LIST = "/photos";
  static String API_SEARCH_LIST = "/search/photos";

  /// Headers
  static Map<String, String> getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept-Version': 'v1',
      'Authorization':'Client-ID _CF1t7eMK9M3FbgBNupTRVoAALKOAMGY493unkq9La4'
    };
    return headers;
  }

  static List<Pinterest> parsePost(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Pinterest> posts = list.map((model) => Pinterest.fromJson(model)).toList();
    return posts;
  }
  static List<Pinterest> parseSearchPost(String responseBody) {
    Map<String, dynamic> json = jsonDecode(responseBody);
    List<Pinterest> photos = List<Pinterest>.from(json["results"].map((x) => Pinterest.fromJson(x)));
    return photos;
  }


  static Future<List<Pinterest>> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(URL, api, params); // http or https
    if (kDebugMode) {
      print('LOOK HERE: $uri');
    }
    final Response response = await get(uri, headers: getHeaders());

    if(response.statusCode == 200){
      return api == API_SEARCH_LIST ? compute(parseSearchPost, response.body) : compute(parsePost, response.body);
    }
    else if(response.statusCode == 404){
      throw Exception('Not Found');
    }
    else{
      throw Exception('Can\'t get post');
    }
  }

  static Map<String, dynamic> paramsGET({int page = 1, String sortBy = 'popular'}) {
    Map<String, String> params = {};
    params.addAll({
      "page":page.toString(),
      'per_page': '20',
      'order_by': sortBy
    });
    return params;
  }
  static Map<String, dynamic> paramsSearch({int page = 1, int per_page = 20, required String topic}) {
    Map<String, String> params = {};
    params.addAll({
      "page":page.toString(),
      'per_page': per_page.toString(),
      'query': topic
    });
    return params;
  }



}