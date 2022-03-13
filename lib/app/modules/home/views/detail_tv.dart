import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/tvshow.dart';
import '../controllers/home_controller.dart';

HomeController homeController = Get.find<HomeController>();

class DetailTvView extends StatelessWidget {
  DetailTvView({Key? key, required this.detail}) : super(key: key);
  Result detail;
  @override
  Widget build(BuildContext context) {
    print('uri - ${detail.id}');

    // homeController.fetchCast(detail.id!);
    // homeController.fetchVideos(detail.id!);

    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: Get.height * 0.6,
                  width: Get.width,
                  child: Hero(
                      tag: '${detail.posterPath}',
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/${detail.posterPath}',
                        fit: BoxFit.fill,
                      )),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    // color: Colors.amber,
                    child: IconButton(
                      onPressed: () async {
                        // print(
                        //     'play - ${homeController.allVideos.value[0].key}');
                        // final url =
                        //     'https://www.youtube.com/watch?v=${homeController.allVideos.value[0].key}';
                        // if (await canLaunch(url)) {
                        //   print('GO YOUTUBE');
                        //   await launch(url,
                        //       enableJavaScript: true, forceWebView: true);
                        // } else {
                        //   print('error..');
                        // }
                      },
                      icon: Icon(
                        Icons.play_circle,
                        size: 100,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black87,
                        ),
                        child: IconButton(
                          onPressed: () {
                            homeController.allCast.clear();
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            detail.favorite!
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: detail.favorite! ? Colors.red : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        detail.name.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(detail.overview.toString()),
                  ],
                ),
              ),
            ),
            // Text(
            //   'Cast',
            //   style: TextStyle(
            //     fontSize: 15,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            // Container(
            //   margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            //   width: Get.width,
            //   height: 75,
            //   child: Obx(
            //     () => SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: homeController.allCast.value
            //             .map(
            //               (e) => Container(
            //                 margin: EdgeInsets.only(right: 5),
            //                 width: 80,
            //                 child: Column(
            //                   children: [
            //                     CircleAvatar(
            //                       radius: 30,
            //                       backgroundColor: Colors.grey[100],
            //                       backgroundImage: NetworkImage(
            //                           'https://image.tmdb.org/t/p/original/${e.profilePath}'),
            //                     ),
            //                     Text(
            //                       '${e.name}',
            //                       style: TextStyle(
            //                         fontSize: 12,
            //                       ),
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             )
            //             .toList(),
            //       ),
            //     ),
            //   ),
            // ),
            // Row(
            //   children: [
            //     Container(
            //       height: 75,
            //       width: Get.width,
            //       // color: Colors.amber,
            //       child: ListView.builder(
            //         itemCount: 3,
            //         itemBuilder: (BuildContext context, index) {
            //           return ListTile(
            //             leading: ClipOval(
            //               child: SizedBox.fromSize(
            //                 size: Size.fromRadius(20), // Image radius
            //                 child: Image.network(
            //                     'https://image.tmdb.org/t/p/original/${homeController.allCast.value[0].profilePath}',
            //                     fit: BoxFit.cover),
            //               ),
            //             ),
            //             name: Text('${homeController.allCast.value[0].name}'),
            //           );
            //         },
            //       ),
            //     ),
            //     // Column(
            //     //   children: [
            //     //     CircleAvatar(
            //     //       radius: 25,
            //     //       backgroundColor: Colors.grey[100],
            //     //       backgroundImage: NetworkImage(
            //     //           'https://image.tmdb.org/t/p/original/${homeController.allCast.value[0].profilePath}'),
            //     //     ),
            //     //     Text('${homeController.allCast.value[0].name}'),
            //     //   ],
            //     // ),
            //     //   ],
            //     // ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  label: Text('${detail.voteAverage}'),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.people_outline_sharp,
                    color: Colors.black87,
                    size: 15,
                  ),
                  label: Text('${detail.popularity}'),
                ),
                TextButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.language,
                    color: Colors.black87,
                    size: 15,
                  ),
                  label: Text('${detail.originalLanguage}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
