import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:todo/modules/home/home_binding.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_drawer.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/utils/regex.dart';
import 'package:todo/widgets/widgets.dart';

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
        body: ListView(children: <Widget>[
          Column(
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
                              style:
                                  TextStyle(fontSize: 28.0, color: Colors.grey),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: AppTextField(
                                            controller: controller.textCtrl,
                                            validator: (value) =>
                                                Regex.fullNameValidator(value!),
                                            textFieldType: TextFieldType.NAME,
                                            decoration: InputDecoration(
                                              hintStyle: TextStyle(
                                                  color: Colors.black54),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text('Add Todo',
                          style: TextStyle(color: Colors.black45)),
                    ),
                  ],
                ),
              ),
              Wrap(
                children: [
                  widgetTodo(),
                  widgetTodo(),
                ],
              )
            ],
          ),
        ]));
  }

  Widget widgetTodo() {
    return Container(
      height: 380,
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        color: Color.fromRGBO(254, 123, 123, 1),
      ),
    );
  }
}
