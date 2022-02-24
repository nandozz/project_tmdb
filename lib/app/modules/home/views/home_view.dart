import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tmdb_test/app/modules/home/widgets/favorite_widgets.dart';
import 'package:tmdb_test/app/modules/home/widgets/tvshow_widgets.dart';
import 'package:tmdb_test/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../widgets/movie_widgets.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303243),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.indexPage.value,
            children: [
              MoviePage(),
              FavoritePage(),
              TvPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.indexPage.value,
            onTap: (index) {
              controller.changePage(index);
            },
            backgroundColor: Color(0xff303243),
            selectedItemColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.movie,
                  size: 30,
                  // color: Color(0xff136A5A),
                ),
                label: 'Movie',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.live_tv,
                  size: 30,
                  // color: Color(0xff136A5A),
                ),
                label: 'TV Show',
              ),
            ],
          )),
    );
  }
}
