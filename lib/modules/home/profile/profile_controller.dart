import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo/data/model/user.dart';
import 'package:todo/data/providers/auth_provider.dart';
import 'package:todo/data/providers/user_provider.dart';
import 'package:todo/utils/storage_service.dart';
import 'package:todo/widgets/widgets.dart';

class ProfileController extends GetxController {
  //user service
  final ProfileProvider userProvider = Get.find<ProfileProvider>();
  final AuthProvider authProvider = Get.find<AuthProvider>();

  //text field controller
  final TextEditingController inputName = TextEditingController();
  // final TextEditingController inputPhone = TextEditingController();
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputAdress = TextEditingController();
  var isLoading = false.obs;
  //image
  final ImagePicker _picker = ImagePicker();
  var imageURL = '';

  final editFormKey = GlobalKey<FormState>();

  // final gender = ''.obs;

  final currentUser = User(
    id: "",
    name: "name",
    phone: "phone",
    email: "email",
    address: "address",
    image: "image",
  ).obs;

  final _id = ''.obs;
  final _name = ''.obs;
  final _phone = ''.obs;
  final _email = ''.obs;
  final _address = ''.obs;
  final _image = ''.obs;

  String get id => _id.value;

  set id(value) {
    _id.value = value;
  }

  String get name => _name.value;

  set name(value) {
    _name.value = value;
  }

  String get phone => _phone.value;

  set phone(value) {
    _phone.value = value;
  }

  String get email => _email.value;

  set email(value) {
    _email.value = value;
  }

  String get address => _address.value;

  set address(value) {
    _address.value = value;
  }

  String get image => _image.value;

  set image(value) {
    _image.value = value;
  }

  @override
  void onInit() {
    id = LocalStorage.getUser()!.id;
    name = LocalStorage.getUser()!.name;
    phone = LocalStorage.getUser()!.phone;
    email = LocalStorage.getUser()!.email;
    address = LocalStorage.getUser()!.address;
    image = LocalStorage.getUser()!.image;

    currentUser.value = User(
      id: id,
      name: name,
      phone: phone,
      email: email,
      address: address,
      image: image,
    );
    super.onInit();
  }

  @override
  void onClose() {
    inputName.dispose();
    inputEmail.dispose();
    super.onClose();
  }

  //upload image function
  void uploadImage() async {
    try {
      final pickedFile =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      isLoading(true);
      if (pickedFile != null) {
        var response = await userProvider.uploadFile(pickedFile.path);
        if (response.ok) {
          //get image url from api response
          imageURL = response.data!.image;
          await LocalStorage.updateUser(response.data!);
          Get.snackbar('Success', 'Image uploaded successfully',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        } else if (response.code == HttpStatus.unauthorized) {
          Get.snackbar('Unauthorization', 'token expired');
        } else {
          Get.snackbar('Failed', 'Error Code: $response',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Failed', 'Image not selected',
            margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }

  void pickImagesFromGallery() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      isLoading(true);
      if (result != null) {
        var response = await userProvider.uploadFile(result.files.single.path);
        if (response.ok) {
          imageURL = response.data!.image;
          await LocalStorage.updateUser(response.data!);
          currentUser.value.image = response.data!.image;
          Get.snackbar('Success', 'Image uploaded successfully',
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10));
        } else {
          print(response);
          Get.snackbar('Loi', "Loi gui api");
        }
      }
    } finally {
      isLoading(false);
    }
  }

  //Edit profile infomation function
  Future editProfileInfo(
    String name,
    String email,
    String address,
  ) async {
    if (editFormKey.currentState!.validate()) {
      final map = {
        'name': name,
        'email': email,
        'address': address,
      };
      try {
        final response = await ProfileProvider().updateUserInfo(map);
        print('Update Response: ${response.toString()}');
        if (response.ok) {
          Get.back();

          await LocalStorage.updateUser(response.data!);
          currentUser.value = response.data!;
          customSnackbar().snackbarDialog(
              'Susscessfully', 'Edit information susscessfully');
          Get.reload();
        } else {
          if (response.code == HttpStatus.forbidden) {
            customSnackbar()
                .snackbarDialog('failed', 'Sometihing went wrong, try again');
          } else if (response.code == HttpStatus.unauthorized) {
            customSnackbar()
                .snackbarDialog('failed', 'Sometihing went wrong, try again');
          } else {
            customSnackbar()
                .snackbarDialog('failed', 'Sometihing went wrong, try again');
          }
        }
      } finally {}
    } else {}
  }

  //Logout
  Future logout() async {
    final response = await authProvider.logout();
    LocalStorage.logout();
    Get.deleteAll();
    Get.offAllNamed('/');
  }

  Future refreshToken() async {
    final response = await authProvider.refreshToken();
    if (response.ok) {
      print(response);
    } else {
      print(response);
    }
  }
}
