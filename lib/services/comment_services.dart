import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/comment_model.dart';

class CommentServices {
  static Future<void> addComment(CommentModel comment) async{
    try {
      await supabase.from(commentTable).insert(comment.toMap());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> updateComment(CommentModel comment) async {
    try {
      await supabase.from(commentTable).update(comment.updateContent()).eq("commentId", comment.commentId);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> deleteComment(String id) async{
    try {
      await supabase.from(commentTable).delete().eq("commentId", id);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<List<CommentModel>> getAllComments() async {
    try {
      return await supabase
        .from(commentTable)
        .select()
        .then((value) => value.map((e) => CommentModel.fromMap(e)).toList());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
}