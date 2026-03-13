import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServices {
  static Future<AuthResponse> loginWithEmailPassword(String email, String password) async{
    try {
      return await supabase.auth.signInWithPassword(
        email: email,
        password: password
      );
    } catch (e) {
      ShowResultMessage.showToastMessage("Tài khoản hoặc mật khẩu không đúng", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<AuthResponse> createUser(String email, String password) async{
    try {
      return await supabase.auth.signUp(
        email: email,
        password: password
      );
    } catch (e) {
      ShowResultMessage.showToastMessage("Tạo tài khoản không thành công", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> logOut() async{
    try {
      await supabase.auth.signOut();
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
  static Future<void> updateUserProfile({
    required String email,
    required String password,
    required String phone
  }) async{
    try {
      await supabase.auth.updateUser(
        UserAttributes(
          email: email,
          password: password,
          phone: phone
        )
      );
    } catch (e) {
      ShowResultMessage.showToastMessage("Đã xảy ra lỗi", AppColors.red);
      print("Error: $e");
      rethrow;
    }
  }
}