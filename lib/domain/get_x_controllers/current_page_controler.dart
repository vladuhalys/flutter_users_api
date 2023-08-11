import 'package:get/get.dart';

class CurentPageController extends GetxController {
  var currentPage = 1.obs;

  nextPage() {
    currentPage.value++;
  }

  prevPage() {
    currentPage.value--;
  }
}
