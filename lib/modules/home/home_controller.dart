import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todo/data/model/task.dart';
import 'package:todo/data/model/todo.dart';
import 'package:todo/data/model/user.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/data/providers/todo_provider.dart';
import 'package:todo/data/providers/user_provider.dart';
import 'package:todo/utils/storage_service.dart';
import 'package:todo/widgets/widgets.dart';

class HomeController extends GetxController {
  final AuthProvider authProvider = Get.find<AuthProvider>();
  final ProfileProvider userProvider = Get.find<ProfileProvider>();
  final TodoProvider todoProvider = Get.find<TodoProvider>();

  final textCtrl = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  //
  final _title = ''.obs;

  //
  final _isLoading = true.obs;

  final _task = <Task>[].obs;

  get title => _title.value;

  set title(value) {
    _title.value = value;
  }

  List<Task> get participants => _task;

  set participants(value) {
    _task.value = value;
  }

  //
  get isLoading => _isLoading.value;

  set isLoading(value) {
    _isLoading.value = value;
  }

  final _todos = <Todo>[].obs;

  List<Todo> get todos => _todos;

  set todos(List<Todo> value) {
    _todos.value = value;
  }

  @override
  void onInit() {
    //  loadTodos();
    super.onInit();
  }

  Future createTodo() async {
    final map = {
      'title': textCtrl.text,
      'userphone': LocalStorage.getUser()!.phone.toString(),
      // 'date': DateTime.now(),
      // 'tasks': null,
    };
    final respones = await todoProvider.createTodo(map);
    if (respones.ok) {
      customSnackbar().snackbarDialog('Thông báo', 'Tạo todo thành công');
      todoProvider.getTodoByPhone(LocalStorage.getUser()!.phone);
      Get.offAllNamed('/home');
      textCtrl.clear();
    } else
      print(respones);
  }

  // Future loadTodos() async {
  //   final response =
  //       await todoProvider.getTodoByPhone(LocalStorage.getUser()!.phone);
  //   // if (response.ok) {
  //   //   for (var item in response.data!) {
  //   //     todos.add(item);
  //   //   }
  //   // } else {
  //   //   print(response);
  //   // }
  // }
}
