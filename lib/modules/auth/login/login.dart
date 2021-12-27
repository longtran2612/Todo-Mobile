import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo/data/providers/auth_provider.dart';

import '/data/providers/user_provider.dart';
import '/modules/auth/auth.dart';
import '/utils/regex.dart';
import '/widgets/widgets.dart';
import '/themes/theme.dart';

import '../../../utils/storage_service.dart';

part 'login_screen.dart';
part 'login_controller.dart';
