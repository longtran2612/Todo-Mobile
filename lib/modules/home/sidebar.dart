import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/home/home_controller.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
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
          ListTile(
            title: const Text('Name'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Text("Name"),
          Text("Phone"),
          Text("Email"),
          Text("Address"),
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
}
