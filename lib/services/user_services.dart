import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/model/user_model.dart';

class UserServices {
  static Future<void> addUserToTable(UserModel user) async{
    try {
      await supabase.from(userTable).insert(user.toMap());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> updateUser(UserModel user) async{
    try {
      await supabase.from(userTable).update(user.updateMap()).eq("id", user.id);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> deleteUser(String id) async{
    try {
      await supabase.from(userTable).delete().eq("id", id);
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<List<UserModel>> getUserById(String id) async{
    try {
      return await supabase
        .from(userTable)
        .select()
        .eq("id", id)
        .then((value) => value.map((e) => UserModel.fromMap(e)).toList());
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
}