import 'package:flutter_users_api/data/api/api_provider.dart';
import 'package:flutter_users_api/domain/get_x_controllers/current_page_controler.dart';
import 'package:flutter_users_api/domain/models/user.dart';
import 'package:get/get.dart';

class UserListController extends GetxController with StateMixin<List<User>> {
  final ApiProvider _apiProvider = ApiProvider();
  var currentPageController = Get.find<CurentPageController>();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() {
    _apiProvider.fetchUsers(currentPageController.currentPage.value).then(
        (response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
