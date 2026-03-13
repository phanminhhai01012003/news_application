import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/presentation/views/authentication/signin_signup.dart';

class LoginMethod extends StatelessWidget {
  const LoginMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bạn hãy chọn phương thức đăng nhập mà bạn muốn",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30),
                Button(
                  width: double.infinity, 
                  height: 50,
                  radius: 33,
                  buttonColor: AppColors.black, 
                  onPressed: () => Navigator.push(
                    context,
                    AnimateNavigation(
                      child: SigninSignup(), 
                      begin: Offset(0, 1)
                    )
                  ), 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email,
                        size: 15,
                      ),
                      Text(
                        "Tài khoản",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 15),
                Button(
                  width: double.infinity, 
                  height: 50,
                  radius: 33,
                  buttonColor: AppColors.red, 
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.google,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Google",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 15),
                Button(
                  width: double.infinity, 
                  height: 50,
                  radius: 33,
                  buttonColor: AppColors.blue, 
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 15,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Facebook",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}