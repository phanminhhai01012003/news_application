import 'package:flutter/material.dart';
import 'package:news_application/services/local_storage_services.dart';

class SetupState extends ChangeNotifier{
  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;

  int _selectFontSize = 1;
  int get selectFontSize => _selectFontSize;

  bool get isLight => _theme == ThemeMode.light;
  bool get isDark => _theme == ThemeMode.dark;
  bool get isSystem => _theme == ThemeMode.system;

  bool get isSmallFontSize => _selectFontSize == 0;
  bool get isDefaultFontSize => _selectFontSize == 1;
  bool get isLargeFontSize => _selectFontSize == 2;

  SetupState(){
    loadThemeData();
    loadFontSizeData();
  }

  void saveThemeData() async{
    try {
      await LocalStorageServices.setIntValue('theme', _theme.index);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void saveFontSizeData() async{
    try {
      await LocalStorageServices.setIntValue('font_size', selectFontSize);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void loadThemeData() async{
    try {
      final index = await LocalStorageServices.getIntValue('theme') ?? 0;
      _theme = ThemeMode.values[index];
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void loadFontSizeData() async {
    try {
      final index = await LocalStorageServices.getIntValue('font_size') ?? 0;
      _selectFontSize = index;
      notifyListeners();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  void setupTheme(ThemeMode mode){
    if (_theme != mode){
      _theme = mode;
      saveThemeData();
      notifyListeners();
    }
  }

  void setupFontSize(int selected){
    if (_selectFontSize != selected){
      _selectFontSize = selected;
      saveFontSizeData();
      notifyListeners();
    }
  }

  void get lightTheme => setupTheme(ThemeMode.light);
  void get darkTheme => setupTheme(ThemeMode.dark);
  void get systemTheme => setupTheme(ThemeMode.system);

  void get smallFont => setupFontSize(0);
  void get defaultFont => setupFontSize(1);
  void get bigFont => setupFontSize(2);
}