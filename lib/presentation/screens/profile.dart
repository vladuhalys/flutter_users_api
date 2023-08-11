import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_users_api/domain/get_x_controllers/current_user_get_x.dart';
import 'package:flutter_users_api/domain/get_x_controllers/internet_connection_controler.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = Get.find<CurrentUserController>().getCurrentUser();
    var connection = Get.find<InternetConnectionController>();

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Profile of user #${user.id}'),
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (connection.connectivityResult != ConnectivityResult.none)
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(35)), // Image border
                        child: Image.network(user.avatar, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                const SizedBox(height: 25),
                Text('${user.firstname} ${user.lastname}',
                    style: GoogleFonts.quicksand(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        textStyle: const TextStyle(color: Colors.blue))),
                const SizedBox(height: 25),
                Text('${user.email}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          )),
    );
  }
}
