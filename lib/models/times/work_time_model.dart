import 'package:consultation_project/models/times/day_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_time_model.g.dart';

@JsonSerializable()
class WorkTimeModel {
  final int? id;
  final int? user_id;
  final int day_id;
  final String time_start;
  final String time_end;
  final DayModel? day;

  WorkTimeModel({
    this.id,
    this.user_id,
    required this.day_id,
    required this.time_end,
    required this.time_start,
    this.day,
  });

  factory WorkTimeModel.fromJson(Map<String, dynamic> json) =>
      _$WorkTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkTimeModelToJson(this);
}
