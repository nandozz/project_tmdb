import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_test/app/modules/home/controllers/home_controller.dart';
import 'package:tmdb_test/app/modules/home/views/detail_view.dart';
import 'dart:convert';

import '../views/detail_tv.dart';
// import 'package:tmdb_test/app/modules/home/widgets/card.dart';

HomeController homeController = Get.find<HomeController>();
// bool isFavorite = false;
String favoriteName = '';

class TvPage extends StatelessWidget {
  TvPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            UserWidget(),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Category(category: 'On the Air', fetch: 'on_the_air'),
                  Category(category: 'Top Rated', fetch: 'top_rated'),
                  Category(category: 'Popular', fetch: 'popular'),
                  Category(category: 'Airing Today', fetch: 'airing_today'),
                ],
              ),
            ),
            GetX<HomeController>(
              builder: (homeController) => Container(
                height: Get.height * 0.68,
                child: homeController.allTv.isEmpty
                    ? Column(
                        children: [
                          Center(child: CircularProgressIndicator()),
                        ],
                      )
                    : GridView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        controller: homeController.scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: homeController.allTv.value.length,
                        itemBuilder: (BuildContext context, index) {
                          favoriteName = '';
                          homeController.tvshowFavorite.value.length > 0
                              ? homeController.tvshowFavorite.value
                                  .forEach((element) {
                                  favoriteName += json.encode(element['name']);
                                })
                              : null;

                          String title =
                              '"${homeController.allTv.value[index].name}"';

                          // isFavorite = favoriteName.contains(title);
                          homeController.allTv.value[index].favorite =
                              favoriteName.contains(title);
                          ;
                          print(
                              '$index/${homeController.allTv.length}-${homeController.dataPage}: $title - $favoriteName - ${homeController.allTv.value[index].favorite}');

                          return GestureDetector(
                              onTap: () {
                                homeController.readFavorite();
                                Get.to(
                                  () => DetailTvView(
                                    detail: homeController.allTv.value[index],
                                  ),
                                );
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Hero(
                                        tag:
                                            '${homeController.allTv.value[index].backdropPath}',
                                        child: Image.network(
                                          'https://image.tmdb.org/t/p/original/${homeController.allTv.value[index].backdropPath}',
                                          fit: BoxFit.cover,
                                          width: Get.width,
                                          height: Get.height,
                                          loadingBuilder: (BuildContext context,
                                              Widget child,
                                              ImageChunkEvent?
                                                  loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    homeController.allTv
                                                        .value[index].name,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.black87,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                                Text(
                                                  homeController.allTv
                                                      .value[index].voteAverage
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.amber,
                                                      fontSize: 18),
                                                  // textAlign: TextAlignVertical.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white70,
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                              ),
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  print(
                                                      'isFavorite: ${homeController.allTv.value[index].favorite}');
                                                  if (homeController.allTv
                                                      .value[index].favorite) {
                                                    homeController
                                                        .allTv
                                                        .value[index]
                                                        .favorite = false;

                                                    homeController
                                                        .tvshowFavorite.value
                                                        .removeWhere(
                                                            (element) =>
                                                                element["id"] ==
                                                                homeController
                                                                    .allTv
                                                                    .value[
                                                                        index]
                                                                    .id);

                                                    print(
                                                        'REMOVE ${homeController.allTv.value[index].toJson()} FROM ${homeController.tvshowFavorite}');
                                                  } else {
                                                    print('ADD from TV');
                                                    homeController
                                                        .tvshowFavorite
                                                        .add(homeController
                                                            .allTv[index]
                                                            .toJson());

                                                    print(
                                                        '${homeController.allTv.value[index].name} Saved');
                                                  }
                                                  homeController
                                                          .allTv
                                                          .value[index]
                                                          .favorite =
                                                      !homeController
                                                          .allTv
                                                          .value[index]
                                                          .favorite;
                                                  homeController.allTv
                                                      .refresh();
                                                  homeController.tvshowFavorite
                                                      .refresh();

                                                  homeController.saveFavorite();
                                                  print(homeController
                                                      .tvshowFavorite.value);
                                                },
                                                icon: Obx(() => Icon(
                                                      homeController
                                                              .allTv
                                                              .value[index]
                                                              .favorite
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_outline,
                                                      color: homeController
                                                              .allTv
                                                              .value[index]
                                                              .favorite
                                                          ? Colors.red
                                                          : Colors.black,
                                                    ))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        color: Colors.black87,
                                        child: Text(
                                          homeController
                                              .allTv.value[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  String category;
  String fetch;
  Category({
    Key? key,
    required this.category,
    required this.fetch,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            // print(index);
            if (homeController.categoryMovie.value != category) {
              homeController.allTv.clear();
              print('allTv Clear');
              homeController.dataPage.value = 1;
            }
            homeController.categoryMovie.value = category;
            homeController.fetchCategory.value = fetch;
            homeController.fetchTv(homeController.dataPage.value);
            print(
                '${homeController.categoryMovie.value} - ${homeController.fetchCategory.value} - page: ${homeController.dataPage.value}');
          },
          child: Container(
            padding: EdgeInsets.all(10),
            // height: 40,
            margin: EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
                color: fetch == homeController.fetchCategory.value
                    ? Colors.black87
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                    color: fetch == homeController.fetchCategory.value
                        ? Colors.white
                        : Colors.grey,
                    fontSize: 14,
                    fontWeight: fetch == homeController.fetchCategory.value
                        ? FontWeight.w800
                        : FontWeight.normal),
              ),
            ),
          ),
        ));
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Movie',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        Container(
          width: 225,
          child: Stack(
            children: [
              TextField(
                controller: null,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5C5C5C)),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Color(0xff9C9C9C),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff303243),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff303243),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                      left: 10, bottom: 0, top: 0, right: 0),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        // homeController.dataPage.value++;
                        // homeController
                        //     .fetchTv(homeController.dataPage.value);
                      },
                      icon: Icon(Icons.search_rounded)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
