import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginDetails {
  late SharedPreferences prefs;
  late GetStorage box;

  save(username) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('user', username);
  }

  retrieveUserName() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  retriveUserNameFromGetStrogare() async {
    final box = GetStorage();
    await box.read('saveuser');
  }

  saveUserName(username) {
    final box = GetStorage();
    box.write('saveuser', username);
    box.listen(() {
      'saveuser';
    });
  }
}
