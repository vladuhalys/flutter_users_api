import 'package:flutter/material.dart';
import 'package:flutter_users_api/presentation/screens/about.dart';
import 'package:flutter_users_api/presentation/screens/home.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
      ],
    );
  }
}
