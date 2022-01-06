import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo/data/model/todo.dart';
import 'package:todo/modules/home/home_binding.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_drawer.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/utils/regex.dart';
import 'package:todo/widgets/widgets.dart';
import 'package:intl/intl.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      appBar: WidgetAppBar(
        title: 'Todoooooo',
        actions: [
          IconButton(
              onPressed: () => Get.toNamed('/setting'),
              icon: const Tooltip(
                  message: 'Cai Dat', child: const Icon(Icons.settings)))
        ],
      ),
      drawer: ProfileDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Todo ',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Lists',
                          style: TextStyle(fontSize: 28.0, color: Colors.grey),
                        )
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Get.dialog(AlertDialog(
                        scrollable: true,
                        title: Text(
                          'createtodo'.tr,
                          textAlign: TextAlign.center,
                        ),
                        content: StatefulBuilder(
                          builder: (context, setState) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: Form(
                                key: controller.nameFormKey,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: AppTextField(
                                        controller: controller.textCtrl,
                                        validator: (value) =>
                                            Regex.fullNameValidator(value!),
                                        textFieldType: TextFieldType.NAME,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              TextStyle(color: Colors.black54),
                                          hintText: 'entertodoname'.tr,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('CANCEL'),
                            onPressed: () => Get.back(),
                          ),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () => {
                              FocusScope.of(context).unfocus(),
                              controller.createTodo(),
                            },
                          ),
                        ],
                      ));
                    },
                    iconSize: 30.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child:
                      Text('Add Todo', style: TextStyle(color: Colors.black45)),
                ),
                SizedBox(
                  height: 250,
                  width: 500,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.todos.length,
                      itemBuilder: (context, i) {
                        final todo = controller.todos[i];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.transparent),
                                color: i % 2 == 0
                                    ? Color.fromRGBO(254, 123, 123, 1)
                                    : Colors.pinkAccent,
                              ),
                              padding: EdgeInsets.all(15),
                              height: 240,
                              width: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            controller.todos[i].title,
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Divider(color: Colors.blueAccent)
                                      ],
                                    ),
                                  ),
                                  Text(controller.todos[i].note),
                                  Text(DateFormat('dd/MM/yyyy')
                                      .format(controller.todos[i].date)),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetTodo(String title, String date) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 380,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.transparent),
        color: Color.fromRGBO(254, 123, 123, 1),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: 28, color: Colors.pinkAccent),
      ),
    );
  }
}
