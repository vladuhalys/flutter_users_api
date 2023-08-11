import 'package:flutter/material.dart';
import 'package:flutter_users_api/domain/get_x_controllers/local_user_controler.dart';
import 'package:flutter_users_api/presentation/widgets/user_card.dart';
import 'package:get/get.dart';

class HomeWithoutInternet extends StatelessWidget {
  const HomeWithoutInternet({super.key});

  @override
  Widget build(BuildContext context) {
    var localUser = Get.find<LocalUserController>();
    localUser.initState();

    return Obx(() => ListView.builder(
        itemCount: localUser.users.length,
        itemBuilder: (context, index) {
          return UserCard(user: localUser.users[index]);
        }));
  }
}
