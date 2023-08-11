import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_users_api/domain/get_x_controllers/internet_connection_controler.dart';
import 'package:flutter_users_api/presentation/widgets/home_with_inet.dart';
import 'package:flutter_users_api/presentation/widgets/home_without_inet.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InternetConnectionController>(
      builder: (internetController) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: Obx(() => Text(
                      (internetController.connectivityResult.value ==
                              ConnectivityResult.none)
                          ? 'Not Connected'
                          : 'Connected',
                    )),
                centerTitle: true,
              ),
              body: (internetController.connectivityResult.value ==
                      ConnectivityResult.none)
                  ? const HomeWithoutInternet()
                  : const HomeWithInternet()),
        );
      },
    );
  }
}
