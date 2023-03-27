import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedFavouritesViewModel extends ChangeNotifier {
  SavedFavouritesViewModel() : super() {
    getFavourites();
  }
  String? _message;
  List<String> favouriteList = [];
  String? get message => _message;

  setErrorMessage(String message) {
    _message = message;
  }

  getFavourites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('favs');
      favouriteList = items!;
      notifyListeners();
    } catch (e) {
      setErrorMessage(e.toString());
    }
  }
}
