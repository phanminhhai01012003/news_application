import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/core/app_colors.dart';
import 'package:news_application/core/common_constants.dart';
import 'package:news_application/state/app_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageAnimationSlider extends StatefulWidget {
  const ImageAnimationSlider({super.key});

  @override
  State<ImageAnimationSlider> createState() => _ImageAnimationSliderState();
}

class _ImageAnimationSliderState extends State<ImageAnimationSlider> {
  final carouselController = CarouselSliderController();
  void animateToSlide(int index) => carouselController.animateToPage(index);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppState>(
      builder: (controller) {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: slideImages.length,  
              options: CarouselOptions(
                initialPage: 0,
                height: 150,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    controller.changeAnimationIndex(index);
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) => Container(
                width: double.infinity,
                margin: EdgeInsets.all(8),
                child: Image.network(
                  slideImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5),
            AnimatedSmoothIndicator(
              activeIndex: controller.imageIndex.value, 
              count: slideImages.length,
              onDotClicked: (index) => animateToSlide(index),
              effect: SlideEffect(
                activeDotColor: AppColors.blue,
                dotColor: AppColors.grey,
                dotHeight: 10,
                dotWidth: 10
              ),
            )
          ]
        );
      },
    );
  }
}