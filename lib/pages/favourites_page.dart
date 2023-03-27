import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dvt/utils/data_util.dart';
import 'package:weather_app_dvt/utils/view/colors_util.dart';
import 'package:weather_app_dvt/utils/view/font_styles_util.dart';
import 'package:weather_app_dvt/utils/view/sizes_util.dart';
import 'package:weather_app_dvt/utils/view/strings_utils.dart';
import 'package:weather_app_dvt/viewModels/favourites_view_model.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    FavouritesViewModel favouritesViewModel =
        context.watch<FavouritesViewModel>();
    return Scaffold(
      backgroundColor: ColorsUtil.cloudyColor,
      body: Column(
        children: [
          //Header
          Container(
            alignment: Alignment.center,
            height: SizesUtil.phoneHeight * 0.17,
            width: SizesUtil.phoneWidth,
            color: ColorsUtil.rainyColor,
            child: Text(
              StringsUtil.topBestCities,
              style: textStyleBoldWhite22,
            ),
          ),
          //Body
          Expanded(
            child: ListView.builder(
                itemCount: favouritesViewModel.favouriteLocationList!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              favouritesViewModel
                                  .favouriteLocationList![index].location!,
                              style: textStyleBoldWhite16,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: favouritesViewModel
                                    .favouriteLocationList![index].color,
                              ),
                              onPressed: () {
                                favouritesViewModel.addFavourite(index);
                              },
                            ),
                          ],
                        ),
                        Container(
                          height: SizesUtil.phoneHeight * 0.003,
                          color: ColorsUtil.sunnyColor,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          //Footer
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsUtil.rainyColor,
        foregroundColor: ColorsUtil.whiteColor,
        onPressed: () {
          favouritesViewModel.gotoFavourites();
        },
        label: const Text(StringsUtil.goToFavourites),
      ),
    );
  }
}
