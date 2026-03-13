class RecentModel {
  late String recentId;
  late String userId;
  late String newsId;
  late DateTime viewedAt;
  RecentModel({
    required this.recentId,
    required this.userId,
    required this.newsId,
    required this.viewedAt
  });
  factory RecentModel.fromMap(Map<String, dynamic> data){
    return RecentModel(
      recentId: data['recentId'] ?? "", 
      userId: data['userId'] ?? "", 
      newsId: data['newsId'] ?? "",
      viewedAt: DateTime.parse(data['viewedAt'] ?? DateTime.now().toIso8601String())
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'recentId': recentId,
      'userId': userId,
      'newsId': newsId,
      'viewedAt': viewedAt.toIso8601String()
    };
  }
}