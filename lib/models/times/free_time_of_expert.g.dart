// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_time_of_expert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeTimeOfExpertModel _$FreeTimeOfExpertModelFromJson(
        Map<String, dynamic> json) =>
    FreeTimeOfExpertModel(
      id: json['id'] as int,
      name: json['name'] as String,
      av_times: (json['av_times'] as List<dynamic>)
          .map((e) => AVTimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FreeTimeOfExpertModelToJson(
        FreeTimeOfExpertModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'av_times': instance.av_times,
    };
