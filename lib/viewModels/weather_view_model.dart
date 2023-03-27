import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_dvt/model/forecast_model.dart';
import 'package:weather_app_dvt/services/location_service.dart';
import 'package:weather_app_dvt/services/weather_service.dart';
import 'package:weather_app_dvt/utils/view/colors_util.dart';
import 'package:weather_app_dvt/utils/view/icons_util.dart';
import 'package:weather_app_dvt/utils/view/images_util.dart';
import '../model/weather.dart';
import '../model/weather_model.dart';
import '../services/navigation_service.dart';
import '../utils/data_util.dart';
import '../utils/service_locator.dart';
import 'package:intl/intl.dart';

class WeatherViewModel extends ChangeNotifier {
  WeatherViewModel() : super() {
    getCurrentWeather();
    getWeatherForecast();
  }
  //
  final locationService = locator<LocationService>();
  final weatherService = locator<WeatherService>();
  final NavigationService _navigationService = locator<NavigationService>();
  //Prvate properties
  WeatherModel? _weatherModel;
  ForecastModel? _forecastModel;
  List<ListElement>? forecastList = [];
  List<Weather>? weatherList = [];
  List<String>? prefsList = [];
  List<ListElement>? daysList = [];
  String? _weatherType;
  String? _image;
  Color? _color;
  String? _icon;
  bool? _loading;
  bool? _isException = false;
  String? _message;
  //getters
  String? get image => _image;
  String? get weatherType => _weatherType;
  Color? get color => _color;
  String? get icon => _icon;
  bool? get loading => _loading;
  bool? get isException => _isException;
  WeatherModel? get weatherModel => _weatherModel;
  ForecastModel? get forecastModel => _forecastModel;
  String? get message => _message;
  //setters

  setIsException(bool isException) {
    _isException = isException;
    notifyListeners();
  }

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setIcon(String icon) {
    _icon = icon;
    notifyListeners();
  }

  setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  setImage(String image) {
    _image = image;
    notifyListeners();
  }

  setWeatherType(String weatherType) {
    _weatherType = weatherType;
    notifyListeners();
  }

  setforecastWeather(ForecastModel forecastModel) {
    _forecastModel = forecastModel;
    notifyListeners();
  }

  setWeather(WeatherModel weatherModel) {
    _weatherModel = weatherModel;
    notifyListeners();
  }

  setErrorMessage(String message) {
    _message = message;
    notifyListeners();
  }

  //Method for getting the current weather
  getCurrentWeather() async {
    try {
      setLoading(true);
      //getting the location's longtitude and latitude
      var response = await locationService.getCurrentLocationService();
      //Consuming the current weather service
      final weatherData =
          await weatherService.getCurrentWeatherService(response!);
      //seting the Image, color and weather type acorting to the codes
      currentWeather(weatherData!);
      setWeather(weatherData);
      //stop loading
      setLoading(false);
    } catch (e) {
      setIsException(true);
      setErrorMessage(e.toString());
    }
  }

  getWeatherForecast() async {
    try {
      var response = await locationService.getCurrentLocationService();
      final weatherForecast =
          await weatherService.getWeatherForecastService(response!);

      forecastList = weatherForecast?.list!.toSet().toList();

      forecastList!.removeWhere((element) => element.dtTxt == element.dtTxt!);
      forecastList!.sort((a, b) => a.dtTxt!.compareTo(b.dtTxt!));

      for (var weather in weatherForecast!.list!) {
        var dtx = weather.dtTxt;
        var date = dtx!.substring(0, dtx.indexOf(' '));
        var temp = weather.main!.temp;

        for (var element in weather.weather!) {
          if (rainyIdList.contains(element.id.toString())) {
            setIcon(IconsUtil.rainIcon);
          } else if (cloudyIdList.contains(element.id.toString())) {
            setIcon(IconsUtil.patlySunnyIcon);
          } else if (sunnyIdList.contains(element.id.toString())) {
            setIcon(IconsUtil.clearIcon);
          }
        }
        var formet = DateTime.parse(date);
        String dates = DateFormat.EEEE().format(formet);

        daysList!
            .add(ListElement(dtTxt: dates, temp: temp.toString(), icon: icon));
        daysList = daysList!.toSet().toList();
      }

      final ls = daysList!.map((e) => e.dtTxt).toSet();
      daysList!.retainWhere((x) => ls.remove(x.dtTxt));

      setforecastWeather(weatherForecast);
    } catch (e) {
      setIsException(true);
      setErrorMessage(e.toString());
    }
  }

  goToFavourites() {
    _navigationService.navigateTo('/FavouritesPage');
  }

  currentWeather(WeatherModel? weatherData) {
    for (var weather in weatherData!.weather!) {
      if (rainyIdList.contains(weather.id.toString())) {
        setImage(ImagesUtil.seaRainyImage);
        setWeatherType("RAINY");
        setColor(ColorsUtil.rainyColor);
      } else if (cloudyIdList.contains(weather.id.toString())) {
        setImage(ImagesUtil.seaCloudyImage);
        setWeatherType("CLOUDY");
        setColor(ColorsUtil.cloudyColor);
      } else if (sunnyIdList.contains(weather.id.toString())) {
        setImage(ImagesUtil.seaSunnyImage);
        setWeatherType("SUNNY");
        setColor(ColorsUtil.sunnyColor);
      }
    }
  }
}
