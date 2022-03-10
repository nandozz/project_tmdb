import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tmdb_test/app/data/services/remote_services.dart';
import 'dart:convert';

import '../../../data/model/movie.dart';

class HomeController extends GetxController {
  final ScrollController scrollController = ScrollController();

  RxString categoryTvShow = 'On the Air'.obs;
  RxString categoryMovie = 'Now Playing'.obs;
  RxString fetchCategory = 'now_playing'.obs;

  RxInt indexPage = 0.obs;
  RxInt indexCategory = 0.obs;
  RxInt dataPage = 1.obs;

  RxList allData = [].obs;
  RxList allTv = [].obs;
  RxList allCast = [].obs;
  RxList allVideos = [].obs;

  RxList movieFavorite = [].obs;
  RxList tvshowFavorite = [].obs;
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

  void fetchMovie(int page) async {
    var data = await RemoteServices.fetchMovie(page);
    if (data != null) {
      allData.value.addAll(data.results);
      allData.refresh();

      // allData.value = receiveData.value;
      // print('allData - : ${allData.value[0].title}');
      print('allData length: ${allData.value.length}');
    } else {
      print('error add datanya cuy');
    }
  }

  void fetchTv(int page) async {
    var data = await RemoteServices.fetchTv(page);
    if (data != null) {
      allTv.value.addAll(data.results);
      allTv.refresh();

      // allTv.value = receiveData.value;
      // print('allTv - : ${allTv.value[0].title}');
      print('allTv length: ${allTv.value.length}');
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

  void fetchVideos(int id) async {
    var data = await RemoteServices.fetchVideos(id);
    if (data != null) {
      allVideos.value = data.results;
      print('allVideos - : ${allVideos.value[0].key}');
    } else {
      print('error add datanya cuy');
    }
  }

  void saveFavorite() async {
    movieFavorite.value = movieFavorite.toSet().toList();
    tvshowFavorite.value = tvshowFavorite.toSet().toList();

    final box = GetStorage();
    await box.write(
      'myFavorite',
      {
        'movie': movieFavorite.value,
        'tvshow': tvshowFavorite.value,
      },
    );
  }

  void clearFavorite() async {
    print('All Favorite CLEAR');
    movieFavorite.clear();
    tvshowFavorite.clear();
    final box = GetStorage();
    box.remove('myFavorite');
  }

  void readFavorite() async {
    await GetStorage.init();
    final box = GetStorage();
    final data = await box.read('myFavorite') as Map<String, dynamic>;
    print('GET DATA : ${data['movie']}');
    movieFavorite.value = await List<dynamic>.from(data['movie']);
    print('GET Favovrite Length : ${movieFavorite.value.length}');

    tvshowFavorite.value = await List<dynamic>.from(data['tvshow']);

    // print('GET MOVIE memory : ${movieFavorite.value[0].runtimeType}');
    // print('GET TV SHOW memory : ${tvshowFavorite}');
  }

  @override
  void onInit() async {
    super.onInit();
    readFavorite();
    fetchPlaying();
    scrollController.addListener(
      () {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
          dataPage.value++;
          fetchMovie(dataPage.value);

          print('New Page $dataPage');
        }
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
}
