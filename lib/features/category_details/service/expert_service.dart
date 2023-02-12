import 'dart:convert';

import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/models/expert/expert_attributes_model.dart';
import 'package:consultation_project/models/expert/expert_model.dart';
import 'package:http/http.dart' as http;

import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/models/auth/user_model.dart';
import 'package:provider/provider.dart';

class ExpertService {
  Future<List<ExpertModel>> getCategoryExperts(int categoryId) async {
    try {
      final url = Uri.parse('${Endpoints.user}?type_id=$categoryId');
      var token = locator.get<LocalRepo>().token;
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      });
      final en = jsonEncode(response.body);
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      final experts = (jsonResponse['data'] as List)
          .map((e) => ExpertModel.fromJson(e))
          .toList();
      print('rrrrrrrrrrrrrrrr');
      print(experts);
      print('rrrrrrrrrrrrrrrr');
      // print(users[0].toJson());
      // print(jsonResponse['data'][0]['attributes']);
      return experts;
    } catch (e) {
      print('*************eeeeeee**********');
      print(e);
      print('*************eeeeeee**********');
      rethrow;
    }
  }
}
