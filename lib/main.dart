import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:todo/routers/app_pages.dart';
import 'package:todo/routers/app_routers.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/utils/app_binding.dart';
import 'package:todo/utils/storage_service.dart';

import 'utils/global.dart';

Future main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return GetMaterialApp(
      title: 'todo app',
      debugShowCheckedModeBanner: false,
      themeMode: LocalStorage().getThemeMode(),
      theme: AppTheme.light, //theme
      darkTheme: AppTheme.dark,
      getPages: AppPages.pages, //routes
      initialRoute: LocalStorage.checkTokenExpire() == false
          ? Routes.WELCOME
          : Routes.HOME,
      initialBinding: AppBinding(),
    );
  }
}
