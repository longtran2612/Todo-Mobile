import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:nb_utils/nb_utils.dart';

import 'home_controller.dart';

class TodoScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
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
                      textFieldType: TextFieldType.NAME,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black54),
                        hintText: 'add new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Expanded _buildListUser() {
    final l = controller.selected;
    return Expanded(
      child: ListView.builder(
        itemCount: controller.users.length,
        itemBuilder: (context, i) {
          final user = controller.users[i];
          return ListTile(
            onTap: () => controller.onSelect(user),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            title: Text(user.name),
            trailing: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: l.contains(user) ? Colors.blue : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Colors.grey.shade200,
                ),
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 12,
              ),
            ),
          );
        },
      ),
    );
  }
}
