import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt indexPage = 0.obs; //Now = 0.obs;
  void changePage(int index) => indexPage.value = index;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
