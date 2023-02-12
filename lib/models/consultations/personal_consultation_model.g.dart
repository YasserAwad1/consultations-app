// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_consultation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsultationModel _$ConsultationModelFromJson(Map<String, dynamic> json) =>
    ConsultationModel(
        attributes: AttributesModel.fromJson(
            json['attributes'] as Map<String, dynamic>),
        relationships: RelationShipModel.fromJson(
            json['relationships'] as Map<String, dynamic>),
        id: json['id'] as int?,
        );

Map<String, dynamic> _$ConsultationModelToJson(ConsultationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': instance.attributes,
      'relationships': instance.relationships,
    };
