import 'package:get/get.dart';
import 'package:tmdb_test/app/data/model/popular.dart';
import 'package:tmdb_test/app/data/services/remote_services.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString categoryMovie = 'Now Playing'.obs; //Now = 0.obs;
  RxString categoryTvShow = 'On the Air'.obs; //Now = 0.obs;
  RxInt indexPage = 0.obs; //Now = 0.obs;
  RxInt indexCategory = 0.obs; //Now = 0.obs;
  void changePage(int index) => indexPage.value = index;
  void changeCategory(int index) => indexCategory.value = index;

  RxList popularList = [].obs;

  void fetchPopular() async {
    var popular = await RemoteServices.fetchPopular();
    if (popular != null) {
      popularList.value = popular.results;
    } else {
      print('error add datanya cuy');
    }
  }

  @override
  void onInit() {
    fetchPopular();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
