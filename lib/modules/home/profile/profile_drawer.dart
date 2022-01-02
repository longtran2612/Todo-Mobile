import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:todo/modules/home/home_controller.dart';
import 'package:todo/modules/home/profile/profile_controller.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/utils/regex.dart';
import 'package:todo/utils/storage_service.dart';
import 'package:todo/widgets/custom/full_photo.dart';

class ProfileDrawer extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color.fromRGBO(255, 134, 189, 1),
                  Colors.indigo,
                ],
              ),
            ),
            child: Container(
              child: Stack(
                children: <Widget>[
                  Text(
                    "personal".tr,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromRGBO(46, 134, 189, 1)),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TextButton(
                      onPressed: () {
                        Get.dialog(AlertDialog(
                          scrollable: true,
                          title: Text(
                            'editinformation'.tr,
                            textAlign: TextAlign.center,
                          ),
                          content: StatefulBuilder(
                            builder: (context, setState) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: Form(
                                  key: controller.editFormKey,
                                  child: Column(
                                    children: [
                                      buildTextField(
                                          "Name",
                                          '${LocalStorage.getUser()?.name}',
                                          controller.inputName,
                                          (value) =>
                                              Regex.fullNameValidator(value!)),
                                      buildTextField(
                                          "E-mail",
                                          '${LocalStorage.getUser()?.email}',
                                          controller.inputEmail,
                                          (value) =>
                                              Regex.emailValidator(value!)),
                                      //Address input
                                      buildTextField(
                                          "Address",
                                          '${LocalStorage.getUser()?.address}',
                                          controller.inputAdress,
                                          (value) =>
                                              Regex.addressValidator(value!)),
                                    ],
                                  )),
                            ),
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
                                controller.editProfileInfo(
                                  controller.inputName.text,
                                  controller.inputEmail.text,
                                  controller.inputAdress.text,
                                ),
                              },
                            ),
                          ],
                        ));
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(255, 134, 189, 1)),
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Obx(() {
                                  if (controller.isLoading.value) {
                                    return Container(
                                      width: 120,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: AppColors.dark),
                                        shape: BoxShape.circle,
                                        image: const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/images/place_avatar.png"),
                                        ),
                                      ),
                                    );
                                  } else {
                                    if (controller.imageURL.length != 0) {
                                      return GestureDetector(
                                        onTap: () => Get.to(() => FullPhoto(
                                            url: controller.imageURL)),
                                        child: CachedNetworkImage(
                                          width: 120,
                                          height: 105,
                                          imageUrl: controller.imageURL,
                                          fit: BoxFit.cover,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  CircleAvatar(
                                            backgroundColor: AppColors.light,
                                            backgroundImage: imageProvider,
                                            // radius: 50,
                                          ),
                                          placeholder: (context, url) =>
                                              const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                "assets/images/place_avatar.png"),
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                backgroundColor:
                                                    AppColors.light,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      );
                                    } else {
                                      return GestureDetector(
                                        onTap: () => Get.to(() => FullPhoto(
                                            url: controller
                                                .currentUser.value.image)),
                                        child: Container(
                                          width: 120,
                                          height: 105,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: AppColors.dark),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        controller.currentUser
                                                            .value.image),
                                              )),
                                        ),
                                      );
                                    }
                                  }
                                }),
                                // pick image button
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          side: const BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        primary: Colors.white,
                                        backgroundColor: Color(0xFFF5F6F9),
                                      ),
                                      onPressed: () {
                                        Get.bottomSheet(
                                          Container(
                                            decoration: const BoxDecoration(
                                              color: AppColors.light,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                              ),
                                            ),
                                            child: Wrap(
                                              alignment: WrapAlignment.end,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.end,
                                              children: [
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.camera),
                                                  title: const Text('Camera'),
                                                  onTap: () {
                                                    Get.back();
                                                    controller.uploadImage();
                                                  },
                                                ),
                                                ListTile(
                                                  leading:
                                                      const Icon(Icons.image),
                                                  title: const Text('Gallery'),
                                                  onTap: () {
                                                    Get.back();
                                                    controller
                                                        .pickImagesFromGallery();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      child: SvgPicture.asset(
                                          "assets/icons/Camera Icon.svg"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              controller.currentUser.value.name,
                              style: TextStyle(
                                  fontSize: 26, color: AppColors.light),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildInfoField("Phone", controller.currentUser.value.phone),
          buildInfoField("E-mail", controller.currentUser.value.email),
          buildInfoField("Address", controller.currentUser.value.address),
        ],
      ),
    );
  }

  Widget buildInfoField(String labelText, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.lightBlue,
          padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor:
              Get.isDarkMode ? Colors.grey.shade900 : const Color(0xFFF5F6F9),
        ),
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                labelText,
                style: TextStyle(
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black38),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText,
      String placeholder,
      TextEditingController txtController,
      String? Function(String?)? validator) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: validator,
        controller: txtController..text = placeholder,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
