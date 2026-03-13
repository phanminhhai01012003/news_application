class NewsModel {
  late String newsId;
  late List<String> file;
  late String title;
  late String tag;
  late String summary;
  late String details;
  late String userId;
  late DateTime createdAt;
  late int views;
  late List<Map<String, dynamic>> likes;
  NewsModel({
    required this.newsId,
    required this.file,
    required this.title,
    required this.tag,
    required this.summary,
    required this.userId,
    required this.details,
    required this.createdAt,
    required this.views,
    required this.likes
  });
  factory NewsModel.fromMap(Map<String, dynamic> data){
    return NewsModel(
      newsId: data['newsId'] ?? "", 
      file: List<String>.from(data['file'] ?? []), 
      title: data['title'] ?? "",
      tag: data['tag'] ?? "", 
      summary: data['summary'] ?? "", 
      details: data['details'] ?? "",
      userId: data['userId'] ?? "",
      createdAt: DateTime.parse(data['createdAt'] ?? DateTime.now().toIso8601String()), 
      views: data['views'] ?? 0,
      likes: List<Map<String, dynamic>>.from(data['likes'] ?? [])
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'newsId': newsId,
      'file': file,
      'title': title,
      'tag': tag,
      'summary': summary,
      'details': details,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'views': views,
      'likes': likes
    };
  }
  Map<String, dynamic> updateMap() {
    return {
      'file': file,
      'title': title,
      'tag': tag,
      'summary': summary,
      'details': details,
    };
  }
}