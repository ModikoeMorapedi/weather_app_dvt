import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app_dvt/pages/pages.dart';
import 'package:weather_app_dvt/utils/view/colors_util.dart';
import 'package:weather_app_dvt/utils/view/lottie_util.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherPage(),
      ),
    );
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.greenColor,
      body: Center(
        child: Lottie.asset(
          LottiePath.weatherLottie,
        ),
      ),
    );
  }
}
