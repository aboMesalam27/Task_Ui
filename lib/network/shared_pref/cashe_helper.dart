// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:toya_1/logic/cubit/guest_methods/save_cart_as_guest_model.dart';
//
// import '../../../core/constant/shared_pref_key.dart';
//
// class CacheHelper {
//   static SharedPreferences? sharedPreferences;
//
//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences!.clear();
//   }
//
//   static Future<bool> putBoolean(
//       {required String key, required bool value}) async {
//     return await sharedPreferences!.setBool(key, value);
//   }
//
//   static bool getBoolean({
//     required String key,
//   }) {
//     return sharedPreferences!.getBool(key)!;
//   }
//
//   static dynamic getData({required String key}) {
//     return sharedPreferences!.get(key);
//   }
//
//   static Future<bool> saveData(
//       {required String key, required dynamic value}) async {
//     if (value is String) return await sharedPreferences!.setString(key, value);
//     if (value is int) return await sharedPreferences!.setInt(key, value);
//     if (value is bool) return await sharedPreferences!.setBool(key, value);
//     if (value is List<String>) {
//       return await sharedPreferences!.setStringList(key, value);
//     }
//     return await sharedPreferences!.setDouble(key, value);
//   }
//
//   static Future<bool> saveStringList({
//     required String key,
//     required dynamic value,
//   }) async {
//     return await sharedPreferences!.setStringList(key, value);
//   }
//
//   static Future<bool> removeData({required String key}) async {
//     return await sharedPreferences!.remove(key);
//   }
//
//   static Future addToCart(String id, int quantity, var price) {
//     return setCartsIds(getCartsIds()
//       ..add(CartGuestModel(variant_id: id, quantity: quantity, price: price)));
//   }
//
//   static getCartsIds() {
//     return _getValueList(CacheHelperKeys.cartKey);
//   }
//
//   static Future<void> setCartsIds(List<String> ids) {
//     return _setValueList(CacheHelperKeys.cartKey, ids);
//   }
//
//   static Future removeCart(String id) {
//     return setCartsIds(getCartsIds()..remove(id));
//   }
//
//   static _getValueList(String cartKey) {
//     return sharedPreferences!.getString(CacheHelperKeys.cartKey);
//   }
//
//   static Future<bool> _setValueList(String key, List<String> value) {
//     return sharedPreferences!.setString(key, jsonEncode(value));
//   }
//
//   static toJoin() {
//     return getCartsIds().join(',');
//   }
//
//   static int getCartItemsLength() {
//     return getCartsIds().length;
//   }
// }
