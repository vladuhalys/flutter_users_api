import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_users_api/data/api/api_provider.dart';
import 'package:flutter_users_api/domain/get_x_controllers/internet_connection_controler.dart';
import 'package:get/get.dart';

class TotalPageController extends GetxController {
  final ApiProvider _apiProvider = ApiProvider();
  var connection = Get.find<InternetConnectionController>();
  var totalPage = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    if (connection.connectivityResult == ConnectivityResult.wifi ||
        connection.connectivityResult == ConnectivityResult.mobile) {
      totalPage.value = await _apiProvider.fetchTotalPage();
    }
  }
}
