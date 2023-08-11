import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetConnectionController extends GetxController {
  var connectivityResult = ConnectivityResult.none.obs;

  @override
  void onInit() {
    updateConnection();
    super.onInit();
  }

  updateConnection() async {
    connectivityResult.value = await Connectivity().checkConnectivity();
    update();
  }
}
