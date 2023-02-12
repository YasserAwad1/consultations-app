import 'dart:io';

import 'package:consultation_project/auth/service/auth_service.dart';
import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  AuthService _service = AuthService();

  Future<bool> register(
    String firstName,
    String lastName,
    String email,
    String password,
    int roleId, {
    String? address,
    String? phoneNumber,
    File? image,
  }) async {
    UserModel newUser = UserModel(
      // bag: 500,
      // image: image!.path, //
      // rate: 3, //
      first_name: firstName,
      last_name: lastName,
      email: email,
      password: password,
      role_id: roleId,
      address: address,
      phone: phoneNumber,
    );
    print(newUser.toJson());
    final success = await _service.register(newUser, image: image);
    print('TESTING REGISTER');
    print(success);
    print('TESTING REGISTER');
    return success;
  }

  login(String email, String password) async {
    try {
      final success = await _service.logIn(email, password);
      if (success) {
        locator.get<LocalRepo>().vartoken(_service.token!);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  logOut() async {
    final _localService = LocalRepo();
    locator.get<LocalRepo>().token = null;
    var loggedOut = await _localService.clear();
    if (loggedOut) {
      return true;
    }
  }
}
