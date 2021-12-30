import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/data/providers/user_provider.dart';
import 'package:todo/modules/auth/login/login.dart';
import 'package:todo/modules/auth/register/register.dart';
import 'package:todo/modules/auth/reset_password/otp_reset_screen.dart';
import 'package:todo/modules/auth/reset_password/reset_password_controller.dart';
import 'package:todo/modules/auth/reset_password/reset_password_screen.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/utils/regex.dart';
import 'package:todo/widgets/widgets.dart';

part 'auth_binding.dart';
part 'auth_controller.dart';
part 'auth_screen.dart';
part 'otp_screen.dart';
