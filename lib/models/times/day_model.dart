import 'package:json_annotation/json_annotation.dart';

part 'day_model.g.dart';


@JsonSerializable()
class DayModel {
  final int id;
  final String name;

  DayModel({
    required this.id,
    required this.name,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);

  Map<String, dynamic> toJson() => _$DayModelToJson(this);


}
