import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/app_routes.dart';
import 'package:news_application/state/app_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Get.put(AppState());
  List<Widget> screens = [
    homePage,
    categoriesPage,
    profile
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        iconSize: 25,
        selectedFontSize: 14,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.green,
        unselectedFontSize: 14,
        unselectedItemColor: AppColors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: "Trang chủ"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            activeIcon: Icon(Icons.category),
            label: "Thể loại"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person),
            label: "Cá nhân"
          )
        ],
        currentIndex: controller.selectedBottomNavBar.value,
        onTap: controller.changeNavIndex,
        type: BottomNavigationBarType.fixed,
      )),
      body: Obx(() => screens[controller.selectedBottomNavBar.value]),
    );
  }
}