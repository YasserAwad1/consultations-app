import 'package:consultation_project/features/reservations/services/reservations_service.dart';
import 'package:consultation_project/models/times/av_time_model.dart';
import 'package:consultation_project/models/times/day_model.dart';
import 'package:consultation_project/models/times/free_time_of_expert.dart';
import 'package:consultation_project/models/times/work_time_model.dart';
import 'package:flutter/material.dart';

class ReservationProvider with ChangeNotifier {
  ReservationService _service = ReservationService();
  List<DayModel> allDays = [];
  List<FreeTimeOfExpertModel> expertFreeTimes = [];
  DayModel? selectedDay;
  AVTimeModel? selectedTime;
  bool? isItemSelected;

  selectDay(int dayId) {
    selectedDay = allDays.singleWhere((day) => day.id == dayId);
    notifyListeners();
  }

  selectTime(int id, int index) {
    selectedTime = expertFreeTimes
        .singleWhere((time) => time.av_times[index].id == id)
        .av_times[index];
    notifyListeners();
  }

  getAllDays() async {
    try {
      allDays = await _service.getAllDays();
    } catch (e) {}
  }

  createWorkTime(int dayId, String startTime, String endTime) async {
    try {
      WorkTimeModel newTime = WorkTimeModel(
        day_id: dayId,
        time_end: endTime,
        time_start: startTime,
      );
      await _service.createTime(newTime);
    } catch (e) {
      print(e);
    }
  }

  getExpertAvailableTimes(int expertId) async {
    try {
      expertFreeTimes = await _service.getExpertAvailableTimes(expertId);
    } catch (e) {
      print(e);
    }
  }

  makeReservation(int expertId, int consultationItemId, int avTime) async {
    try {
      await _service.makeReservation(expertId, consultationItemId, avTime);
    } catch (e) {
      print(e);
    }
  }
}
