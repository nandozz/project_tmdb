import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_test/app/modules/home/widgets/card.dart';

List<Map<String, dynamic>> nowPlaying = [
  {'title': 'Spider-Man', 'rate': 9.0},
  {'title': 'Ant-Man', 'rate': 8.0},
  {'title': 'Ant-Man', 'rate': 8.0},
  {'title': 'Ant-Man', 'rate': 8.0},
  {'title': 'Ant-Man', 'rate': 8.0},
];

class HomePage extends StatelessWidget {
  HomePage({
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
            SearchWidget(),
            TabView(),
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
            height: Get.height * 0.5,
            width: Get.width,
            child: Expanded(
              child: TabBarView(children: [
                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListCard(category: 'Now Playing', film: nowPlaying),
                        ListCard(category: 'Top Rated', film: nowPlaying),
                        ListCard(category: 'Popular', film: nowPlaying),
                        ListCard(category: 'Upcoming', film: nowPlaying),
                      ],
                    ),
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
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
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
              contentPadding:
                  const EdgeInsets.only(left: 10, bottom: 0, top: 0, right: 0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
            ],
          ),
        ],
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  const UserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Hello, ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
              children: [
                TextSpan(
                  text: 'Alex',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80'),
        ),
      ],
    );
  }
}
