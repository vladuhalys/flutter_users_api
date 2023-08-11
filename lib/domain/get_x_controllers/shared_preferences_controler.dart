import 'dart:convert';

import 'package:flutter_users_api/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  SharedPreferences? preferences;

  save(List<User> users) async {
    preferences = await SharedPreferences.getInstance();
    List<String> usrList =
        users.map((item) => jsonEncode(item.toMap())).toList();
    preferences?.setStringList("users_list", usrList);
    print('saved');
  }

  load() async {
    preferences = await SharedPreferences.getInstance();
    List<String>? listString = preferences?.getStringList('users_list');
    if (listString != null) {
      var list =
          listString.map((item) => User.fromMap(json.decode(item))).toList();
      print('loaded');
      return list;
    }
    return [];
  }
}
