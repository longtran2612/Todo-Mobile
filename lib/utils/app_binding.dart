import 'package:get/get.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/modules/auth/auth.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => AuthProvider());
    Get.lazyPut(() => AuthController());
  }
}
