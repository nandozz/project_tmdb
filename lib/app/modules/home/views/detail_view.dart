import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: Get.width,
                  color: Colors.amber,
                  child: FlutterLogo(),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text('Watch Trailer',
                      style: TextStyle(fontSize: 25, color: Colors.white)),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
