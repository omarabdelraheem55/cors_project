import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  String fullName = "full_name";
  String email = "email";
  String phone = "phone";
  String token = "token";

  static setToken({required token}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }
}
