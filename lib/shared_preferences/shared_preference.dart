import 'package:shared_preferences/shared_preferences.dart';

class UserLoginDetails {
  late SharedPreferences prefs;

  save(username) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('user', username);
  }

  retrieveUserName() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
}
