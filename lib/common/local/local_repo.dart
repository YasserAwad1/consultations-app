import 'package:shared_preferences/shared_preferences.dart';

class LocalRepo {
  String? token;
  saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    return token;
  }

  vartoken(String token2) {
    token = token2;
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
