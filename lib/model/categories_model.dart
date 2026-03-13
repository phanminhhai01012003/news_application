class CategoriesModel {
  late String tagId;
  late String tagImage;
  late String tagName;
  CategoriesModel.fromMap(Map<String, dynamic> data){
    tagId = data['tagId'] ?? "";
    tagImage = data['tagImage'] ?? "";
    tagName = data['tagName'] ?? "";
  }
}