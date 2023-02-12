// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationships_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationShipModel _$RelationShipModelFromJson(Map<String, dynamic> json) =>
    RelationShipModel(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      type: TypeModel.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelationShipModelToJson(RelationShipModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'type': instance.type,
    };