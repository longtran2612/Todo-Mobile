import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_controller.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/widgets/custom/full_photo.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Profile'),
          ),
          buildInfoField("Phone", controller.currentUser.value.phone),
          buildInfoField("E-mail", controller.currentUser.value.email),
          buildInfoField("Address", controller.currentUser.value.address),
          TextButton(
              onPressed: () => Get.dialog(
                    AlertDialog(
                      title: const Center(child: Text('Lưu ý')),
                      content: const SingleChildScrollView(
                        child: Text('Bạn có chắc chắn muốn thoát?'),
                      ),
                      actionsAlignment: MainAxisAlignment.spaceEvenly,
                      actions: [
                        ElevatedButton.icon(
                          onPressed: () {
                            controller.logout();
                          },
                          icon: const Icon(Icons.check_circle),
                          // style: ButtonStyle(backgroundColor: Colors.blue),
                          label: const Text(
                            "Xác nhận",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.cancel),
                          // style: ButtonStyle(backgroundColor: Colors.blue),
                          label: const Text(
                            "Hủy",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
              child: Text("logout"))
        ],
      ),
    );
  }

  Widget buildInfoField(String labelText, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.lightBlue,
          padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor:
              Get.isDarkMode ? Colors.grey.shade900 : const Color(0xFFF5F6F9),
        ),
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                labelText,
                style: TextStyle(
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black38),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
