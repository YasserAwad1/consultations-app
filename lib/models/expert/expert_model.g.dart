// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertModel _$ExpertModelFromJson(Map<String, dynamic> json) => ExpertModel(
      id: json['id'] as int?,
      attributes: ExpertAttributesModel.fromJson(
          json['attributes'] as Map<String, dynamic>),
      // relationships: ExpertRelationshipModel.fromJson(
      //     json['relationships'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExpertModelToJson(ExpertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };
