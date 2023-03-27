import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dvt/utils/service_locator.dart';
import 'package:weather_app_dvt/viewModels/favourites_view_model.dart';
import 'package:weather_app_dvt/viewModels/saved_favourites_view_model.dart';

import 'pages/weather_page.dart';
import 'services/navigation_service.dart';
import 'utils/routes.dart';
import 'utils/size_config.dart';
import 'viewModels/weather_view_model.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherViewModel>(
              create: (_) => WeatherViewModel()),
          ChangeNotifierProvider<FavouritesViewModel>(
              create: (_) => FavouritesViewModel()),
          ChangeNotifierProvider<SavedFavouritesViewModel>(
              create: (_) => SavedFavouritesViewModel()),
        ],
        child: OrientationBuilder(builder: (context, orientation) {
          return LayoutBuilder(builder: (context, constraints) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const WeatherPage(),
              navigatorKey: locator<NavigationService>().navigatorKey,
              onGenerateRoute: Routes.generateRoute,
              initialRoute: '/SplashScreenPage',
              // initialRoute: '/HomePage',
            );
          });
        }));
  }
}
