import 'package:flutter/material.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/common/other/show_result_message.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/model/user_model.dart';
import 'package:news_application/presentation/controllers/authentication/on_user.dart';
import 'package:news_application/presentation/views/authentication/login_method.dart';
import 'package:news_application/services/auth_services.dart';

class OnAuth {
  static void onSignInWithAccount(
    BuildContext context, {
      Function()? firstState, 
      Function()? lastState,
      required String email,
      required String password
  }) async{
    firstState?.call();
    await Future.delayed(Duration(seconds: 2));
    await AuthServices.loginWithEmailPassword(email, password).then((response){
      if (response.user != null) {
        ShowResultMessage.showToastMessage("Đăng nhập thành công", AppColors.green);
        lastState?.call();
        Navigator.pushReplacement(
          context,
          AnimateNavigation(
            child: mainPage, 
            begin: Offset(0, 1)
          )
        );
      }
    });
  }
  static void onSignUp(
    BuildContext context, {
      Function()? firstState, 
      Function()? lastState, 
      required String name,
      required String phone,
      required DateTime dateOfBirth,
      required String role,
      required String email,
      required String password
  }) async{
    firstState?.call();
    await Future.delayed(Duration(seconds: 2));
    await AuthServices.createUser(email, password).then((response) async{
      if (response.user != null) {
        UserModel userModel = UserModel(
          id: response.user!.id, 
          userName: name, 
          description: "", 
          dateOfBirth: dateOfBirth, 
          avatar: "", 
          phone: phone, 
          role: role, 
          email: email, 
          password: password, 
          loginMethod: "Email và mật khẩu"
        );
        OnUser.onAddUser(userModel);
        await AuthServices.updateUserProfile(
          email: email, 
          password: password, 
          phone: phone
        );
        lastState?.call();
        ShowResultMessage.showToastMessage("Đăng ký thành công", AppColors.green);
        Navigator.pushReplacement(
          context, 
          AnimateNavigation(
            child: mainPage, 
            begin: Offset(0, 1)
          )
        );
      }
    });
  }
  static void onLogout(BuildContext context) async{
    await AuthServices.logOut();
    Navigator.pushAndRemoveUntil(
      context, 
      AnimateNavigation(
        child: LoginMethod(), 
        begin: Offset(1, 0)
      ), 
      (route) => false
    );
  }
}