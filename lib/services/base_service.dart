import 'dart:convert';

import 'package:weather_app_dvt/utils/constants.dart';
import 'package:http/http.dart' as http;

class BaseService {
  Future getAsync(String url) async {
    var response = await http.get(Uri.parse(url));
    var body = (response.body.isNotEmpty)
        ? await jsonDecode(response.body.toString())
        : "";
    //Check if the response resturned 200
    switch (response.statusCode) {
      case 200:
        return body;
      case 400:
        throw Exception("Geocode not included");
      case 401:
        throw Exception("API Key not activated");
      case 404:
        throw Exception("Wrong ZIP-code or city ID entered");
      case 429:
        throw Exception("API calls per minutes exceded");

      default:
        throw (Exception("Non 200 status code returned"));
    }
  }
}
