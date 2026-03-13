import 'package:flutter/material.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/presentation/views/main/home/image_animation_slider.dart';
import 'package:news_application/presentation/views/main/home/welcome_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              color: AppColors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WelcomeWidget(),
                      IconButton(
                        onPressed: (){}, 
                        icon: Icon(
                          Icons.notifications,
                          size: 20,
                          color: AppColors.white,
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  TextField(
                    readOnly: true,
                    onTap: (){},
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm",
                      filled: true,
                      fillColor: AppColors.white,
                      hintStyle: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                        color: AppColors.grey,
                      )
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            ImageAnimationSlider()
          ],
        ),
      ),
    );
  }
}