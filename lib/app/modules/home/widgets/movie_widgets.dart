import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_test/app/modules/home/controllers/home_controller.dart';
import 'package:tmdb_test/app/modules/home/views/detail_view.dart';

// import 'package:tmdb_test/app/modules/home/widgets/card.dart';

HomeController homeController = Get.find<HomeController>();

class MoviePage extends StatelessWidget {
  MoviePage({
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
                  Category(category: 'Now Playing'),
                  Category(category: 'Top Rated'),
                  Category(category: 'Popular'),
                  Category(category: 'Upcoming'),
                ],
              ),
            ),
            Container(
              height: Get.height * 0.68,
              // color: Colors.amber,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: homeController.popularList.value.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(DetailView());
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
                              child: Image.network(
                                'https://image.tmdb.org/t/p/original/${homeController.popularList.value[index].posterPath}',
                                fit: BoxFit.cover,
                                width: Get.width,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          homeController
                                              .popularList.value[index].title,
                                          style: TextStyle(color: Colors.white),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
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
                                          homeController.popularList
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
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      ),
                                    ),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: Colors.black,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                },
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
  Category({
    Key? key,
    required this.category,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // print(index);
          homeController.categoryMovie.value = category;
          // homeController.changeCategory(index);
        },
        child: Obx(() => Container(
              height: 30,
              margin: EdgeInsets.only(bottom: 40),
              // color: Colors.amber,
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                      color: category == homeController.categoryMovie.value
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 18,
                      fontWeight: category == homeController.categoryMovie.value
                          ? FontWeight.w800
                          : FontWeight.normal),
                ),
              ),
            )));
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
                      onPressed: () {}, icon: Icon(Icons.search_rounded)),
                ],
              ),
            ],
          ),
        ),

        // IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.search,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        // ),
        // CircleAvatar(
        //   radius: 40,
        //   backgroundColor: Colors.blueGrey[100],
        //   backgroundImage: NetworkImage(
        //       'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80'),
        // ),
      ],
    );
  }
}
