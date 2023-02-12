import 'package:consultation_project/models/consultations/attributes_model.dart';
import 'package:consultation_project/models/consultations/relationships_model.dart';
import 'package:consultation_project/models/consultations/type_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'personal_consultation_model.g.dart';

@JsonSerializable()
class ConsultationModel {
  int? id;
  AttributesModel attributes;
  RelationShipModel relationships;

  ConsultationModel({
    required this.attributes,
    required this.relationships,
    this.id,
  });

  factory ConsultationModel.fromJson(Map<String, dynamic> json) =>
      _$ConsultationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationModelToJson(this);
}
