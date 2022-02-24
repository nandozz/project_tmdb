import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/model/movie.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.detail}) : super(key: key);
  Result detail;
  @override
  Widget build(BuildContext context) {
    print('uri - ${detail.posterPath}');

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: Get.height * 0.7,
                  width: Get.width,
                  child: Hero(
                      tag: '${detail.posterPath}',
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original/${detail.posterPath}',
                        fit: BoxFit.fill,
                      )),
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
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 45,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: Get.height * 0.23,
                  left: Get.width * 0.37,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle,
                      size: 100,
                      color: Colors.white70,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          detail.title.toString(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(detail.overview.toString()),
                      ],
                    ),
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
                            Icons.date_range,
                            color: Colors.black87,
                            size: 15,
                          ),
                          label: Text(
                            DateFormat.yMd().format(detail.releaseDate!),
                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
