// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpertAttributesModel _$ExpertAttributesModelFromJson(
        Map<String, dynamic> json) =>
    ExpertAttributesModel(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      role_id: json['role_id'] == null ? null : json['role_id'] as int?,
      address: json['address'] == null? null : json['address'] as String?,
      phone: json['phone'] == null ? null :json['phone'] as String?,
      image: json['image'] == null ? null : json['image'] as String?,
      bag: json['bag'] == null ? null : (json['bag'] as num?)?.toDouble(),
      rate:  json['rate'] == null ? null : json['rate'] as int?,
    );

Map<String, dynamic> _$ExpertAttributesModelToJson(
        ExpertAttributesModel instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'role_id': instance.role_id,
      'address': instance.address,
      'phone': instance.phone,
      'image': instance.image,
      'bag': instance.bag,
      'rate': instance.rate,
    };
