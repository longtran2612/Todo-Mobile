import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:todo/data/connect_service.dart';
import 'package:todo/data/model/network_response.dart';
import 'package:todo/data/model/response_model.dart';
import 'package:todo/data/model/todo.dart';

class TodoProvider {
  static const String url = 'todo';
  static const getTodoURL = '$url/phone=';
  /* get todo by userphone
    */
  Future<NetworkResponse<List<Todo>>> getTodoByPhone(String phone) async {
    try {
      final response = await ConnectService().get(
        '$getTodoURL$phone',
      );
      final parsed = json.decode(response).cast<Map<String, dynamic>>();
      return NetworkResponse.fromResponse(
        response,
        parsed.map<Todo>((json) => Todo.fromJson(json)),
      );
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }

  Future<List<Todo>> fetchPost(String phone) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/todo/phone=$phone'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Todo>((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  /*create todo
    */
  Future<NetworkResponse<Todo>> createTodo(Map map) async {
    try {
      final response = await ConnectService().post(
        url,
        params: map,
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => Todo.fromJson(json),
      );
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }

  /* 
    Delete todo
   */
  Future<NetworkResponse<ResponseMessage>> deleteTodo(String id) async {
    try {
      final response = await ConnectService().delete(
        '$url/delete/$id',
      );
      return NetworkResponse.fromResponse(
          response, (json) => ResponseMessage.fromJson(json));
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }

  //Update user info
  Future<NetworkResponse<Todo>> updateTodo(Map map) async {
    try {
      final response = await ConnectService().patch(
        url,
        params: map,
      );
      return NetworkResponse.fromResponse(
          response, (json) => Todo.fromJson(json));
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
    }
  }
}
