import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_application/common/dialog/no_internet_dialog.dart';
import 'package:news_application/common/other/animate_navigation.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/services/local_storage_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool isLoading = false;
  bool get checkAuth => supabase.auth.currentUser != null; 

  void navigateToPage() async{
    final seen = await LocalStorageServices.getBoolValue('onboarding_seen') ?? false;
    Navigator.pushAndRemoveUntil(
      context, 
      AnimateNavigation(
        child: seen ? (checkAuth ? mainPage : loginMethod) : onboard, 
        begin: Offset(0, 1)
      ), 
      (route) => false
    );
  }

  Future<void> checkInternetConnection() async{
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none){
      showNoInternetDialog(
        context, 
        onPressed: () {
          Navigator.pop(context);
          checkInternetConnection();
        }
      );
    } else {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 5), (){
        navigateToPage();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    _startSplashSequence();
  }

  void _startSplashSequence() async {
    await Future.delayed(Duration(seconds: 5), () {
      checkInternetConnection();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Image.asset(
                  logo,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Visibility(
                visible: isLoading,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitCircle(
                      color: AppColors.white,
                      size: 50,
                      duration: Duration(milliseconds: 1000),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Loading",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}