import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_dvt/model/favourites_model.dart';
import 'package:weather_app_dvt/utils/view/colors_util.dart';

import '../services/navigation_service.dart';
import '../utils/data_util.dart';
import '../utils/service_locator.dart';

class FavouritesViewModel extends ChangeNotifier {
  //FavouriteViewModel constructor
  FavouritesViewModel() : super() {
    //Location list from data file
    setFavouriteLocationList(favouriteLocList);
  }
  //NavigationService service from service locator
  final NavigationService _navigationService = locator<NavigationService>();

  //Private properties
  Color? _color;
  String? _message;
  bool isSelected = false;
  List<String>? _favouriteList;
  List<String>? prefsList = [];
  List<String> items = [];
  List<FavouritesModel>? _favouriteLocationList;
  //getters
  List<FavouritesModel>? get favouriteLocationList => _favouriteLocationList;
  List<String>? get favouriteList => _favouriteList;
  Color? get color => _color;
  String? get message => _message;

  //setters
  setFavouriteLocationList(List<FavouritesModel> favouriteLocationList) async {
    _favouriteLocationList = favouriteLocationList;
    notifyListeners();
  }

  setColor(Color color) {
    _color = color;
    notifyListeners();
  }

  setFavouriteList(List<String> favouriteList) {
    _favouriteList = favouriteList;
    notifyListeners();
  }

  setErrorMessage(String message) {
    _message = message;
    notifyListeners();
  }

  //Method for adding favourite to local storage
  addFavourite(int index) async {
    try {
      //getting a list of saved locations
      final prefs = await SharedPreferences.getInstance();
      items = prefs.getStringList('favs') ?? [];

      for (int i = 0; i < _favouriteLocationList!.length; i++) {
        if (i == index) {
          if (_favouriteLocationList![index].isFavourite == false) {
            _favouriteLocationList![index].isFavourite = true;
          } else if (_favouriteLocationList![index].isFavourite == true) {
            _favouriteLocationList![index].isFavourite = false;
          }
          //adding color to selected icons
          _favouriteLocationList![index].color =
              _favouriteLocationList![index].isFavourite == true
                  ? ColorsUtil.redColor
                  : ColorsUtil.whiteColor;
        }
        notifyListeners();
      }
      //Checking if locations is already added, adding and removing locations
      int count = items
          .where(
              (element) => element == favouriteLocationList![index].location!)
          .length;
      if (count < 1 || _favouriteLocationList![index].isFavourite == true) {
        items.add(_favouriteLocationList![index].location!);

        await prefs.setStringList('favs', items);
      } else {
        items.remove(_favouriteLocationList![index].location!);
        await prefs.setStringList('favs', items);
      }
      notifyListeners();
    } catch (e) {
      setErrorMessage(e.toString());
    }
  }

  //Navigating to saved favourites
  gotoFavourites() {
    _navigationService.navigateTo('/SavedFavourites');
  }
}
