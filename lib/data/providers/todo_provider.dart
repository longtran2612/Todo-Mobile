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
  Future<NetworkResponse<Todo>> getTodoByPhone(String phone) async {
    try {
      final response = await ConnectService().get(
        '$getTodoURL$phone',
      );
      return NetworkResponse.fromResponse(
        response,
        (json) => Todo.fromJson(json),
      );
    } on DioError catch (e) {
      return NetworkResponse.withError(e.response);
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
