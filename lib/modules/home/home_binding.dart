import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:todo/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
