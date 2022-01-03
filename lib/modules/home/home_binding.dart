import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/data/providers/todo_provider.dart';
import 'package:todo/data/providers/user_provider.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(HomeController());
    Get.put<ProfileProvider>(ProfileProvider(), permanent: true);
    Get.put<TodoProvider>(TodoProvider(), permanent: true);
    Get.put<AuthProvider>(AuthProvider(), permanent: true);

    Get.lazyPut(() => HomeController());

    Get.put<ProfileController>(ProfileController());
  }
}
