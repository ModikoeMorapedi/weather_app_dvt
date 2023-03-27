import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_dvt/utils/view/colors_util.dart';
import 'package:weather_app_dvt/utils/view/font_styles_util.dart';
import 'package:weather_app_dvt/utils/view/icons_util.dart';
import 'package:weather_app_dvt/utils/view/sizes_util.dart';
import 'package:weather_app_dvt/utils/view/strings_utils.dart';
import 'package:weather_app_dvt/viewModels/saved_favourites_view_model.dart';

class SavedFavourites extends StatelessWidget {
  const SavedFavourites({super.key});

  @override
  Widget build(BuildContext context) {
    SavedFavouritesViewModel savedFavouritesViewModel =
        context.watch<SavedFavouritesViewModel>();
    savedFavouritesViewModel.getFavourites();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: SizesUtil.phoneHeight * 0.17,
            color: ColorsUtil.cloudyColor,
            alignment: Alignment.center,
            child: Text(
              StringsUtil.favourites,
              style: textStyleBoldWhite22,
            ),
          ),
          Expanded(
              child: Container(
            color: ColorsUtil.sunnyColor,
            child: ListView.builder(
                itemCount: savedFavouritesViewModel.favouriteList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Row(
                      children: [
                        Image.asset(IconsUtil.clearIcon),
                        Text(
                          savedFavouritesViewModel.favouriteList[index],
                          style: textStyleBoldWhite16,
                        ),
                      ],
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
