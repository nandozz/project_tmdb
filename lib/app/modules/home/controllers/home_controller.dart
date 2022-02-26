import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb_test/app/data/services/remote_services.dart';
import 'dart:convert';

import '../../../data/model/movie.dart';

class HomeController extends GetxController {
  RxString categoryMovie = 'Now Playing'.obs;
  RxString fetchCategory = 'now_playing'.obs;

  RxString categoryTvShow = 'On the Air'.obs;
  RxInt indexPage = 0.obs;
  RxInt indexCategory = 0.obs;

  RxList allData = [].obs;
  RxList allCast = [].obs;

  RxList movieFovorite = [].obs;
  RxList tvshowFovorite = [].obs;
  // RxBool isFavorite = false.obs;

  void fetchPlaying() async {
    var playing = await RemoteServices.fetchPlaying();
    if (playing != null) {
      allData.value = playing.results;
      // print('allData - : ${allData.value[0].title}');
    } else {
      print('error add datanya cuy');
    }
  }

  void fetchMovie() async {
    var data = await RemoteServices.fetchMovie();
    if (data != null) {
      allData.value = data.results;
      // print('allData - : ${allData.value[0].title}');
    } else {
      print('error add datanya cuy');
    }
  }

  void fetchCast(int id) async {
    var data = await RemoteServices.fetchCast(id);
    if (data != null) {
      allCast.value = data.cast;
      print('allCast - : ${allCast.value[0].name}');
    } else {
      print('error add datanya cuy');
    }
  }
  // void fetchPopular() async {
  //   var popular = await RemoteServices.fetchPopular();
  //   if (popular != null) {
  //     // popularList.value = popular.results;
  //     allData.value = popular.results;
  //   } else {
  //     print('error add datanya cuy');
  //   }
  // }
  // void fetchTopRated() async {
  //   var data = await RemoteServices.fetchTopRated();
  //   if (data != null) {
  //     allData.value = data.results;

  //     print('allData cuy');
  //   } else {
  //     print('error add datanya cuy');
  //   }
  // }

  //  homeController.movieFovorite.add(
  //                                             json.encode(
  //                                               homeController
  //                                                   .allData.value[index]
  //                                                   .toJson(),
  //                                             ),
  //                                           );
  void saveFavorite() async {
    movieFovorite.value = movieFovorite.toSet().toList();
    tvshowFovorite.value = tvshowFovorite.toSet().toList();

    final box = GetStorage();
    await box.write(
      'myFavorite',
      {
        'movie': movieFovorite.value,
        'tvshow': tvshowFovorite.value,
      },
    );
  }

  void clearFavorite() async {
    print('All Favorite CLEAR');
    movieFovorite.clear();
    tvshowFovorite.clear();
    final box = GetStorage();
    box.remove('myFavorite');
  }

  void readFavorite() async {
    await GetStorage.init();
    final box = GetStorage();
    final data = await box.read('myFavorite') as Map<String, dynamic>;
    print('GET DATA : ${data['movie']}');
    movieFovorite.value = await List<dynamic>.from(data['movie']);
    print('GET Favovrite Length : ${movieFovorite.value.length}');

    tvshowFovorite.value = await List<dynamic>.from(data['tvshow']);

    // print('GET MOVIE memory : ${movieFovorite.value[0].runtimeType}');
    // print('GET TV SHOW memory : ${tvshowFovorite}');
  }

  @override
  void onInit() async {
    super.onInit();
    readFavorite();
    fetchPlaying();
    // fetchCast(634649);
    // fetchMovie();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
