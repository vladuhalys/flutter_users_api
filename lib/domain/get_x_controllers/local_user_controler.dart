import 'package:flutter_users_api/domain/get_x_controllers/shared_preferences_controler.dart';
import 'package:flutter_users_api/domain/models/user.dart';
import 'package:get/get.dart';

class LocalUserController extends GetxController {
  var local = Get.find<SharedPreferencesController>();
  var users = <User>[].obs;

  initState() async {
    users.value = await local.load();
  }
}
