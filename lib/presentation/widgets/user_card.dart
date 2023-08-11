import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_users_api/domain/get_x_controllers/current_user_get_x.dart';
import 'package:flutter_users_api/domain/get_x_controllers/internet_connection_controler.dart';
import 'package:flutter_users_api/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    var connectionController = Get.find<InternetConnectionController>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              children: [
                (connectionController.connectivityResult ==
                        ConnectivityResult.none)
                    ? const Text('Image not available without internet')
                    : CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                const SizedBox(height: 20),
                Text('${user.firstname} ${user.lastname}',
                    style: GoogleFonts.quicksand(
                        fontSize: 20, fontWeight: FontWeight.w800)),
                const SizedBox(height: 15),
                Text(user.email,
                    style: GoogleFonts.notoSans(
                        fontSize: 15,
                        textStyle: TextStyle(color: Colors.grey.shade600))),
                const SizedBox(height: 20),
                FilledButton.tonal(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.blue.shade50),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        fixedSize: MaterialStateProperty.all<Size>(
                            Size(MediaQuery.of(context).size.width, 45))),
                    onPressed: () {
                      var userController = Get.find<CurrentUserController>();
                      userController.updateUser(user);
                      Get.toNamed('/profile', arguments: user);
                    },
                    child: Text('View Profile',
                        style: GoogleFonts.quicksand(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textStyle: const TextStyle(color: Colors.blue)))),
              ],
            ),
          )),
    );
  }
}
