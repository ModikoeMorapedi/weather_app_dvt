import 'dart:convert';

import 'package:weather_app_dvt/utils/constants.dart';
import 'package:http/http.dart' as http;

class BaseService {
  Future getAsync(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      //Check if the response resturned 200 before you decode the response
      if (success == response.statusCode) {
        return json.decode(response.body.toString());
      }
    } on Exception catch (e) {
      rethrow;
    }
  }
}
