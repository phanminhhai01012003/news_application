import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/state/app_state.dart';

class SigninSignup extends StatefulWidget {
  const SigninSignup({super.key});

  @override
  State<SigninSignup> createState() => _SigninSignupState();
}

class _SigninSignupState extends State<SigninSignup> {
  List<Widget> accountPages = [signIn, signUp];
  @override
  void initState() {
    super.initState();
    Get.put(AppState());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: GetBuilder<AppState>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 20, bottom: 16, left: 12, right: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => controller.changeSigninSignupIndex(0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            decoration: BoxDecoration(
                              color: controller.selectedSignInSignUpIndex.value == 0 ? AppColors.blue : AppColors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  color: controller.selectedSignInSignUpIndex.value == 0 ? AppColors.white : AppColors.black,
                                  fontSize: controller.selectedSignInSignUpIndex.value == 0 ? 18 : 14,
                                  fontWeight: controller.selectedSignInSignUpIndex.value == 0 ? FontWeight.bold : FontWeight.normal
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.changeSigninSignupIndex(1),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: 50,
                            decoration: BoxDecoration(
                              color: controller.selectedSignInSignUpIndex.value == 1 ? AppColors.blue : AppColors.white,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Center(
                              child: Text(
                                "Đăng ký",
                                style: TextStyle(
                                  color: controller.selectedSignInSignUpIndex.value == 1 ? AppColors.white : AppColors.black,
                                  fontSize: controller.selectedSignInSignUpIndex.value == 1 ? 18 : 14,
                                  fontWeight: controller.selectedSignInSignUpIndex.value == 1 ? FontWeight.bold : FontWeight.normal
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    accountPages[controller.selectedSignInSignUpIndex.value]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}