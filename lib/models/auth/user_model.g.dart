// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      email: json['email'] as String,
      password: '',
      role_id: json['role_id'] as int,
      id: json['id'] as int,
      address: json['address'] == null ? null : json['address'] as String?,
      phone: json['phone'] == null ? null : json['phone'] as String?,
      image: json['image'] == null ? null : json['image'] as String?,
      wallet: (json['wallet'] as num?)?.toDouble(),
      rate: json['rate'] as int?,
    );

Map<String, String> _$UserModelToJson(UserModel instance) => <String, String>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'password': instance.password,
      'role_id': instance.role_id.toString(),
      if (instance.id != null) 'id': instance.id!.toString(),
      if (instance.address != null) 'address': instance.address!,
      if (instance.phone != null) 'phone': instance.phone!,
      if (instance.rate != null) 'rate': instance.rate!.toString(),
      if (instance.wallet != null) 'wallet': instance.wallet!.toString()
    };
