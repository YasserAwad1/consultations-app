import 'dart:convert';

import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/locator.dart';
import 'package:http/http.dart' as http;
import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/models/auth/user_model.dart';

class UserService {
  Future<UserModel> getCurrentUser() async {
    try {
      final url = Uri.parse(Endpoints.profile);
      var token = locator.get<LocalRepo>().token;
      print(token);
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      });
      final jsonResponse = jsonDecode(response.body);
      final user = UserModel.fromJson(jsonResponse['data']);
      print(user.toJson());
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
    
  }
}
