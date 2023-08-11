import 'package:flutter_users_api/domain/get_x_controllers/shared_preferences_controler.dart';
import 'package:flutter_users_api/domain/models/user.dart';
import 'package:get/get.dart';

class ApiProvider extends GetConnect {
  var sh = Get.find<SharedPreferencesController>();
  Future<List<User>> fetchUsers(int pageNumber) async {
    final response = await get('https://reqres.in/api/users?page=$pageNumber');
    if (response.status.hasError) {
      return sh.load();
    } else {
      var json = response.body['data'] as List<dynamic>;
      return json.map((c) => User.fromJson(c)).toList();
    }
  }

  Future<int> fetchTotalPage() async {
    final response = await get('https://reqres.in/api/users?page=1');
    if (response.status.hasError) {
      return 2;
    } else {
      int result = response.body['total_pages'];
      return result;
    }
  }
}
