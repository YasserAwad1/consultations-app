import 'package:json_annotation/json_annotation.dart';

part 'av_time_model.g.dart';

@JsonSerializable()
class AVTimeModel {
  int id;
  int user_id;
  int work_time_id;
  String time_start;
  String time_end;
  int isBooking;
  bool isSelected = false;

  AVTimeModel({
    required this.id,
    required this.user_id,
    required this.work_time_id,
    required this.time_start,
    required this.time_end,
    required this.isBooking,
  });

  // void toggleSelected() {
  //   isSelected = !isSelected!;
  // }

  factory AVTimeModel.fromJson(Map<String, dynamic> json) =>
      _$AVTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AVTimeModelToJson(this);
}
