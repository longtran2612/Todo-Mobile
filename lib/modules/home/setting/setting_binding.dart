import 'package:get/get.dart';
import 'package:todo/modules/home/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
