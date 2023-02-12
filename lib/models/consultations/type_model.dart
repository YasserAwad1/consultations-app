import 'package:json_annotation/json_annotation.dart';

part 'type_model.g.dart';

@JsonSerializable()
class TypeModel {
  int? id;
  String name;

  TypeModel({
    required this.name,
    this.id,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) =>
      _$TypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TypeModelToJson(this);


}
