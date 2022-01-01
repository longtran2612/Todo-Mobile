import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/data/providers/user_provider.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.put<ProfileProvider>(ProfileProvider(), permanent: true);
    Get.lazyPut<AuthProvider>(() => AuthProvider());

    Get.lazyPut(() => ProfileController());
  }
}
