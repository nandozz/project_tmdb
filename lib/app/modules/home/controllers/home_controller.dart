import 'package:get/get.dart';
import 'package:tmdb_test/app/data/services/remote_services.dart';

class HomeController extends GetxController {
  RxString categoryMovie = 'Now Playing'.obs;
  RxString fetchCategory = 'now_playing'.obs;

  RxString categoryTvShow = 'On the Air'.obs;
  RxInt indexPage = 0.obs;
  RxInt indexCategory = 0.obs;

  RxList allData = [].obs;

  void fetchPlaying() async {
    var playing = await RemoteServices.fetchPlaying();
    if (playing != null) {
      allData.value = playing.results;
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

  @override
  void onInit() {
    fetchPlaying();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
