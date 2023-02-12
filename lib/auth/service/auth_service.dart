import 'dart:convert';
import 'dart:io';

import 'package:consultation_project/common/local/local_repo.dart';
import 'package:http/http.dart' as http;

import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/models/auth/user_model.dart';

class AuthService {
  Map<String, String> headers = {"Accept": "application/json"};
  String? token;

  Future<bool> logIn(String email, String password) async {
    final url = Uri.parse(Endpoints.login);
    final response = await http.post(
      url,
      body: {"email": email, "password": password},
    );
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    if (response.statusCode == 200) {
      token = jsonResponse['data']['token'];
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(UserModel user, {File? image}) async {
    try {
      final url = Uri.parse(Endpoints.register);
      if (image != null) {
        print('with image');
        final request = http.MultipartRequest('POST', url);
        request.files.add(
          await http.MultipartFile.fromPath('image', image.path,
              filename: image.path.split('/').last),
        );

        request.headers.addAll(headers);

        request.fields.addAll(user.toJson());
        http.Response response =
            await http.Response.fromStream(await request.send());
        print('********responseee*******');
        print(response.body);
        print('********responseee*******');
        print(response.statusCode);
        if (response.statusCode == 200) {
          print('resister success');
          return true;
        } else {
          return false;
        }
      } else {
        print('without image');
        final response =
            await http.post(url, headers: headers, body: user.toJson());
        print(response.statusCode);
        print('***********');
        print(response.body);
        print('***********');
        if (response.statusCode == 201) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print('*******e*******');
      print(e);
      print('*******e*******');
      return false;
    }
  }

  
}
