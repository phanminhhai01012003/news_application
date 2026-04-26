class SaveModel {
  late String saveId;
  late String userId;
  late String newsId;
  SaveModel({
    required this.saveId,
    required this.userId,
    required this.newsId
  });
  factory SaveModel.fromMap(Map<String, dynamic> data){
    return SaveModel(
      saveId: data['saveId'] ?? "", 
      userId: data['userId'] ?? "", 
      newsId: data['newsId'] ?? ""
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'saveId': saveId,
      'userId': userId,
      'newsId': newsId
    };
  }
  SaveModel.empty(){
    saveId = "";
    userId = "";
    newsId = "";
  }
}