import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

HomeController homeController = Get.find<HomeController>();

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'Alex\'s ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                      children: [
                        TextSpan(
                          text: 'Favorite',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    homeController.clearFavorite();
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80'),
                  ),
                ),
              ],
            ),

            /////////////////////////////////////////Default tab
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    child: TabBar(
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          ),
                          insets: EdgeInsets.symmetric(horizontal: 50.0)),
                      tabs: [
                        Tab(
                          text: 'Movie',
                        ),
                        Tab(
                          text: 'TV Show',
                        ),
                      ],
                    ),
                  ),
                  //Movie field
                  Container(
                    height: Get.height * 0.65,
                    width: Get.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: TabBarView(children: [
                            Container(
                              child: Obx(
                                () => GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 2 / 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount:
                                      homeController.movieFavorite.value.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/original/${homeController.movieFavorite[index]['poster_path']}',
                                              fit: BoxFit.cover,
                                              width: Get.width,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        homeController
                                                                .movieFavorite
                                                                .value[index]
                                                            ['title'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black87,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        homeController
                                                            .movieFavorite
                                                            .value[index]
                                                                ['vote_average']
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
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        // Get.defaultDialog(title:'Remove ${ }');
                                                        Get.defaultDialog(
                                                          title: 'Delete',
                                                          middleText:
                                                              'Are you sure to delete ${homeController.movieFavorite[index]['title']}\nfrom your favorite ?',
                                                          textCancel: 'Cancel',
                                                          cancelTextColor:
                                                              Colors.black87,
                                                          textConfirm: 'OK',
                                                          confirmTextColor:
                                                              Colors.white,
                                                          buttonColor:
                                                              Colors.black87,
                                                          onCancel: () {},
                                                          onConfirm: () {
                                                            // print(
                                                            //     'REMOVE ${homeController.movieFavorite.value[index].toJson()} FROM ${homeController.movieFavorite}');

                                                            homeController
                                                                .movieFavorite
                                                                .remove(homeController
                                                                        .movieFavorite[
                                                                    index]);

                                                            homeController
                                                                .saveFavorite();
                                                            Get.back();
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            //TV Show field
                            Container(
                              child: Obx(
                                () => GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 2 / 3,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20),
                                  itemCount: homeController
                                      .tvshowFavorite.value.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/original/${homeController.tvshowFavorite[index]['poster_path']}',
                                              fit: BoxFit.cover,
                                              width: Get.width,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        homeController
                                                                .tvshowFavorite
                                                                .value[index]
                                                            ['name'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
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
                                          Container(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black87,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                        size: 15,
                                                      ),
                                                      Text(
                                                        homeController
                                                            .tvshowFavorite
                                                            .value[index]
                                                                ['vote_average']
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
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white70,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        // Get.defaultDialog(title:'Remove ${ }');
                                                        Get.defaultDialog(
                                                          title: 'Delete',
                                                          middleText:
                                                              'Are you sure to delete ${homeController.tvshowFavorite[index]['title']}\nfrom your favorite ?',
                                                          textCancel: 'Cancel',
                                                          cancelTextColor:
                                                              Colors.black87,
                                                          textConfirm: 'OK',
                                                          confirmTextColor:
                                                              Colors.white,
                                                          buttonColor:
                                                              Colors.black87,
                                                          onCancel: () {},
                                                          onConfirm: () {
                                                            // print(
                                                            //     'REMOVE ${homeController.tvshowFavorite.value[index].toJson()} FROM ${homeController.tvshowFavorite}');

                                                            homeController
                                                                .tvshowFavorite
                                                                .remove(homeController
                                                                        .tvshowFavorite[
                                                                    index]);

                                                            homeController
                                                                .saveFavorite();
                                                            Get.back();
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              color: Colors.black87,
                                              child: Text(
                                                homeController.tvshowFavorite
                                                    .value[index]['name'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
