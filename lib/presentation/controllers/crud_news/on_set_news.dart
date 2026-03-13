import 'package:news_application/model/news_model.dart';
import 'package:news_application/services/news_services.dart';

class OnSetNews {
  static void addNewsController(NewsModel news) async{
    await NewsServices.addNews(news);
  }
  static void updateNewsController(NewsModel news) async{
    await NewsServices.updateNews(news);
  }
  static void deleteNewsController(String id) async{
    await NewsServices.deleteNews(id);
  }
}