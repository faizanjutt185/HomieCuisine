import 'package:get/get.dart';

class UserController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var phone = "".obs;
  void updateUser(String newName, String newEmail, String newPhone) {
    name.value = newName;
    email.value = newEmail;
    phone.value = newPhone;

  }
}
