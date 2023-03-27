import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dvt/utils/view/colors_util.dart';
import 'package:weather_app_dvt/utils/view/font_styles_util.dart';
import 'package:weather_app_dvt/utils/view/sizes_util.dart';
import 'package:weather_app_dvt/utils/view/strings_utils.dart';
import 'package:weather_app_dvt/widgets/loading_widget.dart';
import '../viewModels/weather_view_model.dart';
import '../widgets/error_screen_widget.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherViewModel weatherViewModel = context.watch<WeatherViewModel>();
    return weatherViewModel.isException == true
        ? ErrorScreenWidget(
            message: weatherViewModel.message,
          )
        : Scaffold(
            body: weatherViewModel.loading == true
                ? const LoadingWidget()
                : Column(
                    children: [
                      SizedBox(
                        height: SizesUtil.phoneHeight * 0.45,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.asset(
                              weatherViewModel.image!,
                              fit: BoxFit.fill,
                            ),
                            const Positioned(
                                top: 50,
                                left: 100,
                                child: Text("Last updated a few seconds ago")),
                            Positioned(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      "${weatherViewModel.weatherModel?.main!.temp.toString()}°",
                                      style: textStyleBoldWhite36),
                                  Text(weatherViewModel.weatherType!,
                                      style: textStyleNormalWhite36)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: SizesUtil.phoneHeight * 0.07,
                        color: weatherViewModel.color,
                        padding:
                            const EdgeInsets.only(left: 35, right: 35, top: 10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${weatherViewModel.weatherModel?.main!.tempMin.toString()}°",
                                  style: textStyleBoldWhite16),
                              Text(
                                  "${weatherViewModel.weatherModel?.main!.temp.toString()}°",
                                  style: textStyleBoldWhite16),
                              Text(
                                  "${weatherViewModel.weatherModel?.main!.tempMax.toString()}°",
                                  style: textStyleBoldWhite16),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(StringsUtil.min,
                                  style: textStyleNormalWhite16),
                              Text(StringsUtil.current,
                                  style: textStyleNormalWhite16),
                              Text(StringsUtil.max,
                                  style: textStyleNormalWhite16),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        color: ColorsUtil.whiteColor,
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Expanded(
                        child: Container(
                          color: weatherViewModel.color,
                          padding: const EdgeInsets.only(left: 35, right: 35),
                          child: weatherViewModel.forecastModel == null
                              ? Container()
                              : ListView.builder(
                                  itemCount: weatherViewModel.daysList!
                                      .length, //weatherViewModel.forecastModel!.list!.length,
                                  itemBuilder: ((context, index) {
                                    return SizedBox(
                                      height: SizesUtil.phoneHeight * 0.06,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              weatherViewModel
                                                      .daysList![index].dtTxt ??
                                                  "",
                                              style: textStyleBoldWhite16,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              child: Image.asset(
                                                  weatherViewModel.icon!),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                                "${weatherViewModel.daysList![index].temp.toString()}°",
                                                style: textStyleBoldWhite16),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                        ),
                      )
                    ],
                  ),
            floatingActionButton: weatherViewModel.loading == true
                ? Container()
                : FloatingActionButton(
                    backgroundColor: ColorsUtil.greenColor,
                    foregroundColor: ColorsUtil.whiteColor,
                    onPressed: () {
                      weatherViewModel.goToFavourites();
                    },
                    child: const Icon(Icons.favorite),
                  ),
          );
  }
}
