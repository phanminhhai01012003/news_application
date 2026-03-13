import 'package:news_application/model/news_model.dart';
import 'package:news_application/services/news_services.dart';

class OnGetNews {
  static Future<List<NewsModel>> onGetNewsById(String id) async{
    return await NewsServices.getNewsById(id);
  }
  static Future<List<NewsModel>> onGetAllNews() async{
    return await NewsServices.getNews();
  }
  static Future<List<NewsModel>> onGetNewsByCategories(String categories) async{
    return await NewsServices.getNewsByCategories(categories);
  }
  static Future<List<NewsModel>> onGetNewsByDateTime(bool isAscending) async{
    return await NewsServices.getNewsByDate(isAscending);
  }
}