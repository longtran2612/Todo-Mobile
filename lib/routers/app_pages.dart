import 'package:get/get.dart';
import 'package:todo/modules/auth/auth.dart';
import 'package:todo/modules/auth/login/login.dart';
import 'package:todo/modules/auth/register/register.dart';
import 'package:todo/modules/home/home_binding.dart';
import 'package:todo/modules/home/home_screen.dart';
import 'package:todo/utils/app_binding.dart';
import 'package:todo/welcome/welcome_screen.dart';

import 'app_routers.dart';

abstract class AppPages {
  AppPages._();
  static final pages = [
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomeScreen(),
      binding: AppBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(
        numberPhone: '',
      ),
      binding: AuthBinding(),
    ),
  ];
}
