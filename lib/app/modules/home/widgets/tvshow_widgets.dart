import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_test/app/modules/home/controllers/home_controller.dart';
import 'package:tmdb_test/app/modules/home/views/detail_view.dart';

// import 'package:tmdb_test/app/modules/home/widgets/card.dart';

List<Map<String, dynamic>> nowPlaying = [
  {'title': 'Spider-Man', 'rate': 9.0},
  {'title': 'Ant-Man', 'rate': 8.0},
  {'title': 'Aqua-Man', 'rate': 8.0},
  {'title': 'Super-Man', 'rate': 8.0},
  {'title': 'Iron-Man', 'rate': 8.0},
  {'title': 'Iron-Man', 'rate': 8.0},
  {'title': 'Iron-Man', 'rate': 8.0},
];

HomeController homeController = Get.find<HomeController>();

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
                  Category(category: 'On the Air'),
                  Category(category: 'Top Rated'),
                  Category(category: 'Popular'),
                  Category(category: 'Airing Today'),
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
                itemCount: nowPlaying.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(DetailView());
                    },
                    child: Container(
                      // alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            height: 175,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1604200213928-ba3cf4fc8436?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                fit: BoxFit.cover,
                                // height: 175,
                                // width: Get.width,
                              ),
                            ),
                          ),
                          Text(
                            nowPlaying[index]['title'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  );
                },
              ),
            ),
            // TabView(),
          ],
        ),
      ),
    );
  }
}

class TabView extends StatelessWidget {
  const TabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          //Tab Bar
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
          //TV Show field
          Container(
            padding: EdgeInsets.only(bottom: 20),
            height: Get.height * 0.7,
            width: Get.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Category(category: 'Now Playing'),
                    Category(category: 'Top Rated'),
                    Category(category: 'Popular'),
                    Category(category: 'Upcoming'),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    Container(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: 5,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(DetailView());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(nowPlaying[index]['title']),
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          );
                        },
                      ),
                    ),
                    //TV Show field
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // ListCard(title: 'On the air'),
                          ],
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
    );
  }
}

class Category extends StatelessWidget {
  String category;
  Category({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          homeController.categoryTvShow.value = category;
        },
        child: Obx(() => Container(
              height: 30,
              margin: EdgeInsets.only(bottom: 40),
              // color: Colors.amber,
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                      color: category == homeController.categoryTvShow.value
                          ? Colors.white
                          : Colors.black87,
                      fontSize: 18,
                      fontWeight:
                          category == homeController.categoryTvShow.value
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
          'TV Show',
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
