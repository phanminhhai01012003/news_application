import 'package:flutter/material.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/recent_model.dart';
import 'package:news_application/model/save_model.dart';

class NewsState extends ChangeNotifier{
  List<SaveModel> _saveProducts = [];
  List<RecentModel> _viewProducts = [];
  
  List<SaveModel> get saveProducts => _saveProducts;
  List<RecentModel> get viewProducts => _viewProducts;

  NewsState(){
    loadSaveData();
    loadRecentData();
  }

  void addSave(SaveModel save) async{
    _saveProducts.add(save);
    await addSaveData(save);
  }

  void removeSave(SaveModel save) async{
    _saveProducts.remove(save);
    await removeSaveData(save.userId);
  }

  void addRecentView(RecentModel recent) async{
    _viewProducts.add(recent);
    await addRecentData(recent);
  }

  void removeRecentView(RecentModel recent) async {
    _viewProducts.remove(recent);
    await removeRecentData(recent.userId);
  }

  Future<void> addSaveData(SaveModel save) async{
    try {
      await supabase.from(saveTable).insert(save.toMap());
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> addRecentData(RecentModel recent) async{
    try {
      await supabase.from(recentTable).insert(recent.toMap());
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> removeSaveData(String id) async{
    try {
      await supabase.from(saveTable).delete().eq("userId", id);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> removeRecentData(String id) async {
    try {
      await supabase.from(recentTable).delete().eq("userId", id);
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> loadSaveData() async{
    try {
      final data = await supabase.from(saveTable).select().eq("userId", supabase.auth.currentUser!.id);
      _saveProducts = data.map((e) => SaveModel.fromMap(e)).toList();
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  Future<void> loadRecentData() async{
    try {
      final data = await supabase.from(recentTable).select().eq("userId", supabase.auth.currentUser!.id);
      _viewProducts = data.map((e) => RecentModel.fromMap(e)).toList();
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}