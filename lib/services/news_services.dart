import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/news_model.dart';

class NewsServices {
  static Future<void> addNews(NewsModel news) async{
    try {
      await supabase.from(newsTable).insert(news.toMap());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> updateNews(NewsModel news) async{
    try {
      await supabase.from(newsTable).update(news.toMap()).eq("newsId", news.newsId);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> deleteNews(String id) async{
    try {
      await supabase.from(newsTable).delete().eq("userId", id);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<List<NewsModel>> getNewsById(String id) async{
    try {
      return await supabase
        .from(newsTable)
        .select()
        .eq("userId", id)
        .then((value) => value.map((e) => NewsModel.fromMap(e)).toList());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<List<NewsModel>> getNews() async{
    try {
      return await supabase
        .from(newsTable)
        .select()
        .then((value) => value.map((e) => NewsModel.fromMap(e)).toList());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<List<NewsModel>> getNewsByCategories(String categories) async{
    try {
      return await supabase
        .from(newsTable)
        .select()
        .eq("tag", categories)
        .then((value) => value.map((e) => NewsModel.fromMap(e)).toList());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<List<NewsModel>> getNewsByDate(bool isAscending) async{
    try {
      return await supabase
        .from(newsTable)
        .select()
        .order("createdAt", ascending: isAscending)
        .then((value) => value.map((e) => NewsModel.fromMap(e)).toList());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
}