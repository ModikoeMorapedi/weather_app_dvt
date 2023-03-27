import 'package:weather_app_dvt/utils/view/colors_util.dart';

import '../model/favourites_model.dart';

List<String> rainyIdList = [
  "500",
  "501",
  "502",
  "503",
  "504",
  "511"
      "520",
  "521",
  "522",
  "531"
];
List<String> cloudyIdList = [
  "804",
  "803",
  "802",
  "801",
];
List<String> sunnyIdList = [
  "800",
];

List<FavouritesModel> favouriteLocList = [
  FavouritesModel(
      isFavourite: false, location: "New York", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Cape Town", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Paris", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Chicago", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "London", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Rome", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Tokyo", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Amsterdam", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Dubai", color: ColorsUtil.whiteColor),
  FavouritesModel(
      isFavourite: false, location: "Madrid", color: ColorsUtil.whiteColor),
];
