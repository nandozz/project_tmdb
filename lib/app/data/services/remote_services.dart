import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tmdb_test/app/data/model/popular.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<Popular?> fetchPopular() async {
    var response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=91b8baa082ac5f8b8cb042e3683306ab'),
    );

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return popularFromJson(jsonString);
    } else {
      //error message
      return null;
    }
  }
}
