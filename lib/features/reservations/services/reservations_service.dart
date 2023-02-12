import 'dart:convert';

import 'package:consultation_project/models/times/av_time_model.dart';
import 'package:consultation_project/models/times/free_time_of_expert.dart';
import 'package:consultation_project/models/times/work_time_model.dart';
import 'package:http/http.dart' as http;
import 'package:consultation_project/common/constants/end_points.dart';
import 'package:consultation_project/common/local/local_repo.dart';
import 'package:consultation_project/locator.dart';
import 'package:consultation_project/models/times/day_model.dart';

class ReservationService {
  Future<List<DayModel>> getAllDays() async {
    try {
      final url = Uri.parse(Endpoints.days);
      var token = locator.get<LocalRepo>().token;
      final response = await http.get(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      });
      // print(response.body);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var days = (jsonResponse['data'] as List)
            .map((e) => DayModel.fromJson(e))
            .toList();
        return days;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> createTime(WorkTimeModel workTime) async {
    try {
      final url = Uri.parse(Endpoints.workTimes);
      var token = locator.get<LocalRepo>().token;
      final response = await http.post(url,
          headers: {
            "Accept": "application/json",
            'Authorization': 'Bearer $token'
          },
          body: workTime.toJson());
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<FreeTimeOfExpertModel>> getExpertAvailableTimes(
      int ExpertId) async {
    try {
      final url = Uri.parse('${Endpoints.availableTimes}?user_id=$ExpertId');
      var token = locator.get<LocalRepo>().token;
      final response = await http.get(
        url,
        headers: {
          "Accept": "application/json",
          'Authorization': 'Bearer $token'
        },
      );
      final en = jsonEncode(response.body);
      final jsonResponse = jsonDecode(response.body);

      var availableTimes = (jsonResponse['data'] as List)
          .map((e) => FreeTimeOfExpertModel.fromJson(e))
          .toList();
      print(availableTimes);

      if (response.statusCode == 200) {
        return availableTimes;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> makeReservation(
      int expertId, int consultationItemId, int avTime) async {
    try {
      final url = Uri.parse(Endpoints.dates);
      var token = locator.get<LocalRepo>().token;
      final response = await http.post(url, headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer $token'
      }, body: {
        "av_time": avTime.toString(),
        "consultation_item_id": consultationItemId.toString(),
        "booking_on": expertId.toString(),
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}
