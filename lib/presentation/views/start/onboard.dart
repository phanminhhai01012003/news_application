import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/common/other/button.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/services/local_storage_services.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppColors.backgroundGradients),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInUp(
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                child: Image.asset(
                  logo,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              FadeInLeft(
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                child: Text(
                  "Chào mừng bạn đến với PMH24h!",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 10),
              FadeInRight(
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                child: Text(
                  "Hãy dành thời gian vàng của bạn để\nđọc tin tức mới nhất từ chúng tôi",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeInDown(
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                child: Button(
                  width: MediaQuery.of(context).size.width / 2, 
                  height: 50, 
                  radius: 33, 
                  buttonColor: AppColors.green, 
                  onPressed: () async{
                    await LocalStorageServices.setBoolValue('onboarding_seen', true);
                    Navigator.pushAndRemoveUntil(
                      context, 
                      AnimateNavigation(
                        child: loginMethod, 
                        begin: Offset(1, 0)
                      ), 
                      (route) => false
                    );
                  }, 
                  child: Text(
                    "Bắt đầu",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}