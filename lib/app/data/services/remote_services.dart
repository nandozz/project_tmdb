import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_test/app/modules/home/controllers/home_controller.dart';

import '../model/cast.dart';
import '../model/movie.dart';
import '../model/playing.dart';
import '../model/popular.dart';
import '../model/toprated.dart';

String apikey = '91b8baa082ac5f8b8cb042e3683306ab';

// HomeController homeController = Get.put(HomeController());

class RemoteServices {
  static var client = http.Client();

  static Future<Movie?> fetchPlaying() async {
    var response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return movieFromJson(jsonString);
    } else {
      //error message
      return null;
    }
  }

  static Future<Movie?> fetchMovie() async {
    HomeController homeController = Get.find<HomeController>();
    var response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/${homeController.fetchCategory.value}?api_key=$apikey'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return movieFromJson(jsonString);
    } else {
      //error message
      return null;
    }
  }

  static Future<Cast?> fetchCast(int id) async {
    var response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=${apikey}&language=en-US'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return castFromJson(jsonString);
    } else {
      //error message
      return null;
    }
  }
  // static Future<Popular?> fetchPopular() async {
  //   var response = await client.get(
  //     Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apikey'),
  //   );

  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return popularFromJson(jsonString);
  //   } else {
  //     //error message
  //     return null;
  //   }
  // }

  // static Future<TopRated?> fetchTopRated() async {
  //   var response = await client.get(
  //     Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey'),
  //   );

  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return topRatedFromJson(jsonString);
  //   } else {
  //     //error message
  //     return null;
  //   }
  // }

}
