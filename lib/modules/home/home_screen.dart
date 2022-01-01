import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo/modules/home/home_binding.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/sidebar.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/widgets/widgets.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WidgetAppBar(title: 'personal'.tr), drawer: SideBar());
  }
}
