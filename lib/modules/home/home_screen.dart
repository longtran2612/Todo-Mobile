import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo/modules/home/home_binding.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_drawer.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/widgets/widgets.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetAppBar(title: 'personal'.tr),
      drawer: ProfileDrawer(),
      body: TextButton(
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
          child: Text("logout")),
    );
  }
}
