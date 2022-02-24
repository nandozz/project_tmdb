import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  var duration = Duration(seconds: 2);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      initState: (state) {
        Timer(
          duration,
          () {
            Get.offNamed(Routes.HOME);
          },
        );
      },
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/splashimage.jpg',
                height: Get.height, width: Get.width, fit: BoxFit.cover),
            Positioned(
              bottom: 20,
              left: 10,
              child: Text(
                'visualized\nyour\nimagination',
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
