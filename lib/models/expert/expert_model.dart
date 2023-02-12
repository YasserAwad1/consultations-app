import 'package:consultation_project/models/expert/expert_attributes_model.dart';
import 'package:consultation_project/models/expert/expert_relationships_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expert_model.g.dart';

@JsonSerializable()
class ExpertModel {
  int? id;
  ExpertAttributesModel attributes;
  ExpertRelationshipModel? relationships;
  bool? isFavorite = false;

  ExpertModel({
    this.id,
    required this.attributes,
    this.relationships,
  });

  toggleFavriteStatus() {
    isFavorite = !isFavorite!;
  }

  factory ExpertModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertModelToJson(this);
}
