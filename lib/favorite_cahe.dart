import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCahe extends GetxController implements GetxService {
  static SharedPreferences? sharedPreferences;

  static Future<FavCahe> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return FavCahe();
  }

  Future addToFavorite(String id) {
    return setFavoriteIds(getFavoriteIds()..add(id));
  }

  List<String> getFavoriteIds() {
    return _getValueList(CacheHelperKeys.cartKey) ?? <String>[];
  }

  Future<void> setFavoriteIds(List<String> ids) {
    return _setValueList(CacheHelperKeys.cartKey, ids);
  }

  Future removeFavorite(String id) {
    return setFavoriteIds(getFavoriteIds()..remove(id));
  }

  List<String>? _getValueList(String key) {
    return sharedPreferences!.getStringList(key);
  }

  Future<bool> _setValueList(String key, List<String> value) {
    return sharedPreferences!.setStringList(key, value);
  }

  bool isFavourite(String id) {
    return getFavoriteIds().contains(id);
  }
}

abstract class CacheHelperKeys {
  static const String cartKey = 'cartIds';
}
