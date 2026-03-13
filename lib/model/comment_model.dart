class CommentModel {
  late String commentId;
  late String userId;
  late String content;
  late DateTime createdAt;
  late List<Map<String, dynamic>> likes;
  CommentModel({
    required this.commentId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.likes
  });
  factory CommentModel.fromMap(Map<String, dynamic> data){
    return CommentModel(
      commentId: data['commentId'] ?? "", 
      userId: data['userId'] ?? "", 
      content: data['content'] ?? "", 
      createdAt: DateTime.parse(data['createdAt'] ?? DateTime.now().toIso8601String()), 
      likes: List<Map<String, dynamic>>.from(data['likes'] ?? [])
    );
  }
  Map<String, dynamic> toMap(){
    return {
      'commentId': commentId,
      'userId': userId,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'likes': likes
    };
  }
  Map<String, dynamic> updateContent() => {'content': content};
}