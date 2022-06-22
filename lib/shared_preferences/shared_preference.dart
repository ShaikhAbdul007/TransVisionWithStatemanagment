import 'package:get_storage/get_storage.dart';

class UserLoginDetails {
  saveUserName(username) {
    final box = GetStorage();
    box.write('saveuser', username);
  }

  retriveUserNameFromGetStrogare() {
    final box = GetStorage();
    return box.read('saveuser');
  }
}

  // late SharedPreferences prefs;
  // late GetStorage box;
  // save(username) async {
  //   prefs = await SharedPreferences.getInstance();
  //   prefs.setString('user', username);
  // }

  // retrieveUserName() async {
  //   prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('user');
  // }