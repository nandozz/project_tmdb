import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_test/app/modules/home/widgets/card.dart';

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
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80'),
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
                    child: Expanded(
                      child: TabBarView(children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [],
                            ),
                          ),
                        ),
                        //TV Show field
                        Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [],
                            ),
                          ),
                        ),
                      ]),
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
