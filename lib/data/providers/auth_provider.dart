import 'package:dio/dio.dart';
import 'package:todo/data/model/auth.dart';
import 'package:todo/data/model/network_response.dart';
import 'package:todo/data/model/response_model.dart';
import 'package:todo/utils/storage_service.dart';

import '../connect_service.dart';

class AuthProvider {
  //end point
  static const String checkURL = 'auth/check';
  static const String loginURL = 'auth/login';
  static const String resetPasswordURL = 'auth/changePassword';
  static const String registerURL = 'auth/register';
  static const String logoutURL = 'auth/signout';
  static const String refreshTokenUrl = 'auth/refresh_token';

  //Check phone number exist
  Future<Response> checkPhoneExist(String phoneNumber) async {
    try {
      final response = await ConnectService().get('$checkURL/$phoneNumber');
      return response;
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  //Đăng nhập
  Future<NetworkResponse<LoginResponse>> login(Map map) async {
    try {
      final response = await ConnectService().postAuth(loginURL, params: map);
      return NetworkResponse.fromResponse(
        response,
        (json) => LoginResponse.fromJson(json),
      );
    } on DioError catch (e, s) {
      return NetworkResponse.withError(e.response);
    }
  }

  //Đăng ký
  Future<NetworkResponse<ResponseMessage>> register(Map map) async {
    try {
      final response =
          await ConnectService().postAuth(registerURL, params: map);
      return NetworkResponse.fromResponse(
        response,
        (json) => ResponseMessage.fromJson(json),
      );
    } on DioError catch (e, s) {
      return NetworkResponse.withError(e.response);
    }
  }

  // Refresh token
  Future<NetworkResponse<LoginResponse>> refreshToken() async {
    final map = {
      'refreshToken': LocalStorage.getToken()?.refreshToken.toString()
    };
    try {
      final response = await ConnectService().postRefreshToken(
        refreshTokenUrl,
        params: map,
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => LoginResponse.fromJson(json),
      );
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }

  //Logout
  Future<NetworkResponse<ResponseMessage>> logout() async {
    Map map = {
      'refreshToken': LocalStorage.getToken()?.refreshToken.toString()
    };
    try {
      final response = await ConnectService().post(
        logoutURL,
        params: map,
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => ResponseMessage.fromJson(json),
      );
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }

  //Reset password
  Future<NetworkResponse<ResponseMessage>> resetPassword(
      String phone, String newPassword) async {
    Map map = {
      'phoneNumber': phone,
      'newPassword': newPassword,
    };
    try {
      final response = await ConnectService().put(
        logoutURL,
        params: map,
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => ResponseMessage.fromJson(json),
      );
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }
}
