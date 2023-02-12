import 'package:consultation_project/main/settings/sevices/user_service.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;
  UserService _service = UserService();

  getCurrentUser() async {
    try {
      currentUser = await _service.getCurrentUser();
    } catch (e) {
      print(e);
    }
  }
}
