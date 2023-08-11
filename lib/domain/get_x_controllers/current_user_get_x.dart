import 'package:flutter_users_api/domain/models/user.dart';
import 'package:get/get.dart';

class CurrentUserController extends GetxController {
  var user = User.empty().obs;

  updateUser(User user) {
    this.user.value = user;
    update();
  }

  getCurrentUser() {
    return user.value;
  }
}
