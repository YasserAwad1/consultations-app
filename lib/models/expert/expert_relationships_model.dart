import 'package:consultation_project/models/consultations/personal_consultation_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expert_relationships_model.g.dart';

@JsonSerializable()
class ExpertRelationshipModel {
  ConsultationModel consultation_items;

  ExpertRelationshipModel({required this.consultation_items});

  factory ExpertRelationshipModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertRelationshipModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertRelationshipModelToJson(this);
}
