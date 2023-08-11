import 'package:flutter/material.dart';
import 'package:flutter_users_api/domain/get_x_bindings/binding.dart';
import 'package:flutter_users_api/presentation/screens/about.dart';
import 'package:flutter_users_api/presentation/screens/home.dart';
import 'package:flutter_users_api/presentation/screens/profile.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      initialBinding: AllControlerBindings(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
      ],
    );
  }
}
