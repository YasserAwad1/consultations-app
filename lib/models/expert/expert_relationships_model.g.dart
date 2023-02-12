// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_relationships_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertRelationshipModel _$ExpertRelationshipModelFromJson(
        Map<String, dynamic> json) =>
    ExpertRelationshipModel(
      consultation_items: ConsultationModel.fromJson(
          json['consultation_items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpertRelationshipModelToJson(
        ExpertRelationshipModel instance) =>
    <String, dynamic>{
      'consultation_items': instance.consultation_items,
    };
