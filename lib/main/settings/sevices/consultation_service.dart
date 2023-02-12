import 'dart:convert';

import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/models/consultations/attributes_model.dart';
import 'package:http/http.dart' as http;

import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/models/consultations/personal_consultation_model.dart';

class ConsultationService {
  Future<List<ConsultationModel>> getExpertConsultations(int userId) async {
    try {
      final url = Uri.parse('${Endpoints.consultations}?user_id=$userId');
      var token = locator.get<LocalRepo>().token;
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      });
      print('*******1********');
      print(response.statusCode);
      print(response.body);
      print('*******1********');
      final en = jsonEncode(response.body);
      // print(en);
      final jsonResponse = jsonDecode(response.body);
      print('*******2********');
      print(jsonResponse);
      print('*******2********');
      final personalConsultation = (jsonResponse['data'] as List)
          .map(
            (e) => ConsultationModel.fromJson(e),
          )
          .toList();
      print('*******3********');
      print(personalConsultation[0].relationships.type.name);
      print('*******3********');
      if (personalConsultation.isEmpty) {
        return [];
      } else {
        return personalConsultation;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addConsultation(AttributesModel attributes) async {
    try {
      final url = Uri.parse(Endpoints.consultations);
      var token = locator.get<LocalRepo>().token;
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token'
        },
        body: attributes.toJson(),
      );
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> deleteConsultation(int consultationId) async {
    try {
      final url = Uri.parse('${Endpoints.consultations}/$consultationId');
      var token = locator.get<LocalRepo>().token;
      final response = await http.delete(
        url,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        print('delete successful');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
