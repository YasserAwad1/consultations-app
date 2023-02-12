import 'dart:convert';

import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/models/category/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:consultation_project/common/constants/end_points.dart';

class ConsultationCatService {
  var token = locator.get<LocalRepo>().token;

  Future<List<CategoryModel>> getAllConsultationCategories() async {
    try {
      final url = Uri.parse(Endpoints.getConsultationCat);

      final response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      });

      if (response.statusCode == 200) {
        final en = jsonEncode(response.body);
        // print(en);
        final jsonResponse = jsonDecode(response.body);
        // print('sss');

        final categories = (jsonResponse['data'] as List)
            .map((e) => CategoryModel.fromJson(e))
            .toList();
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
