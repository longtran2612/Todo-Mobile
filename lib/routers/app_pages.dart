import 'package:get/get.dart';

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
      name: Routes.OTP,
      page: () => OtpScreen(
        phoneNumber: '',
      ),
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
