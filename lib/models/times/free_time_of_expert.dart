import 'package:consultation_project/models/times/av_time_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'free_time_of_expert.g.dart';

@JsonSerializable()
class FreeTimeOfExpertModel {
  int id;
  String name;
  List<AVTimeModel> av_times;

  FreeTimeOfExpertModel({
    required this.id,
    required this.name,
    required this.av_times,
  });

  factory FreeTimeOfExpertModel.fromJson(Map<String, dynamic> json) =>
      _$FreeTimeOfExpertModelFromJson(json);

  Map<String, dynamic> toJson() => _$FreeTimeOfExpertModelToJson(this);
}
