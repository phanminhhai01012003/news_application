import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices {
  static Future<void> setStringValue(String key, String value) async{
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setString(key, value);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print(e);
      rethrow;
    }
  }
  static Future<void> setIntValue(String key, int value) async{
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setInt(key, value);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print(e);
      rethrow;
    }
  }
  static Future<void> setBoolValue(String key, bool value) async{
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.setBool(key, value);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print(e);
      rethrow;
    }
  }
  static Future<String?> getStringValue(String key) async{
    try {
      final pref = await SharedPreferences.getInstance();
      final value = pref.getString(key);
      return value;
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print(e);
      rethrow;
    }
  }
  static Future<int?> getIntValue(String key) async{
    try {
      final pref = await SharedPreferences.getInstance();
      final value = pref.getInt(key);
      return value;
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print(e);
      rethrow;
    }
  }
  static Future<bool?> getBoolValue(String key) async{
    try {
      final pref = await SharedPreferences.getInstance();
      final value = pref.getBool(key);
      return value;
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print(e);
      rethrow;
    }
  }
}