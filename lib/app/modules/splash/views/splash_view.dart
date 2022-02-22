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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 125, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Watch Now',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'TMDB',
                      style: TextStyle(
                        letterSpacing: 55,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
