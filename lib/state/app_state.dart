import 'package:get/get.dart';

class AppState extends GetxController{
  var selectedSignInSignUpIndex = 0.obs;
  var selectedBottomNavBar = 0.obs;
  var imageIndex = 0.obs;
  void changeSigninSignupIndex(int value){
    selectedSignInSignUpIndex.value = value;
    update();
  }
  void changeNavIndex(int value){
    selectedBottomNavBar.value = value;
    update();
  }
  void changeAnimationIndex(int value){
    imageIndex.value = value;
    update();
  }
}