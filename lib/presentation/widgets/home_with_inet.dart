import 'package:flutter/material.dart';
import 'package:flutter_users_api/domain/get_x_controllers/current_page_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/shared_preferences_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/total_page_controler.dart';
import 'package:flutter_users_api/domain/get_x_controllers/user_list_controler.dart';
import 'package:flutter_users_api/presentation/widgets/home_without_inet.dart';
import 'package:flutter_users_api/presentation/widgets/user_card.dart';
import 'package:get/get.dart';

class HomeWithInternet extends GetView<UserListController> {
  const HomeWithInternet({super.key});

  @override
  Widget build(BuildContext context) {
    var sharedPrefController = Get.find<SharedPreferencesController>();
    var totalPageController = Get.find<TotalPageController>();
    var curentPageController = Get.find<CurentPageController>();
    return GestureDetector(
        onHorizontalDragEnd: (dragDetail) {
          if (dragDetail.velocity.pixelsPerSecond.dx < 1) {
            if (curentPageController.currentPage.value ==
                totalPageController.totalPage.value) {
              return;
            }
            curentPageController.nextPage();
            controller.fetchUsers();
          } else {
            if (curentPageController.currentPage.value == 1) {
              return;
            }
            curentPageController.prevPage();
            controller.fetchUsers();
          }
        },
        child: controller.obx(
          (data) {
            sharedPrefController.save(data!);
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return UserCard(user: data[index]);
                });
          },
          onLoading: const Center(child: Text('Loading...')),
          onError: (error) => const HomeWithoutInternet(),
        ));
  }
}
