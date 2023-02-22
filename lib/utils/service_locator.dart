import 'package:get_it/get_it.dart';
import 'package:weather_app_dvt/services/location_service.dart';
import 'package:weather_app_dvt/services/weather_service.dart';
import 'package:weather_app_dvt/viewModels/weather_view_model.dart';

import '../services/navigation_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  //View Models
  locator.registerFactory<WeatherViewModel>(() => WeatherViewModel());

  //Services
  locator.registerLazySingleton<WeatherService>(() => WeatherService());
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton(() => NavigationService());
}
