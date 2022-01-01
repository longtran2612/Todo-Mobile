import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/utils/storage_service.dart';

class HomeController extends GetxController {
  final AuthProvider authProvider = Get.find<AuthProvider>();

  //Logout
  Future logout() async {
    final response = await authProvider.logout();
    LocalStorage.logout();
    Get.deleteAll();
    Get.offAllNamed('/');
  }
}
