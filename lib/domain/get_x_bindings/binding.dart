import 'package:flutter_users_api/domain/get_x_controllers/current_page_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/current_user_get_x.dart';
import 'package:flutter_users_api/domain/get_x_controllers/internet_connection_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/local_user_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/shared_preferences_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/total_page_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/user_list_controler.dart';
import 'package:get/get.dart';

class AllControlerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurentPageController>(() => CurentPageController());
    Get.lazyPut<InternetConnectionController>(
        () => InternetConnectionController());
    Get.lazyPut<LocalUserController>(() => LocalUserController());
    Get.lazyPut<TotalPageController>(() => TotalPageController());
    Get.lazyPut<UserListController>(() => UserListController());
    Get.lazyPut<CurrentUserController>(() => CurrentUserController());
    Get.lazyPut<SharedPreferencesController>(
        () => SharedPreferencesController());
  }
}
