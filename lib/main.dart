import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "moviemove",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
