import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_dvt/model/forecast_model.dart';
import 'package:weather_app_dvt/model/location_model.dart';
import 'package:weather_app_dvt/services/base_service.dart';

import '../model/weather_model.dart';
import '../utils/constants.dart';

// Consuming the Current weather and forcast services, using the BaseService
class WeatherService extends BaseService {
  //Current weather service, passing Location Model as a paramettr
  Future<WeatherModel?> getCurrentWeatherService(Location location) async {
    String url =
        '$currentWeatherApi?lat=${location.latitude}&lon=${location.longitide}&appid=$apiKey&units=metric';
    var response = await getAsync(url);
    return WeatherModel.fromJson(response);
  }

  //Forcast weather service, using Location class to get latitude and longtitide
  Future<ForecastModel?> getWeatherForecastService(Location? location) async {
    String url =
        '$weatherForecastApi?lat=${location!.latitude}&lon=${location.longitide}&appid=$apiKey&units=metric';

    var response = await getAsync(url);
    return ForecastModel.fromJson(response);
  }
}
