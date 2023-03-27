import 'package:flutter/material.dart';
import 'package:weather_app_dvt/pages/splash_screen_page.dart';

import '../pages/pages.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case '/WeatherPage':
          return const WeatherPage();
        case '/FavouritesPage':
          return const FavouritesPage();
        case '/SplashScreenPage':
          return SplashScreenPage();
        case '/SavedFavourites':
          return const SavedFavourites();
        default:
          return Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          );
      }
    });
  }
}
