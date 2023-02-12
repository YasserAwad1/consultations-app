// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'av_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AVTimeModel _$AVTimeModelFromJson(Map<String, dynamic> json) => AVTimeModel(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      work_time_id: json['work_time_id'] as int,
      time_start: json['time_start'] as String,
      time_end: json['time_end'] as String,
      isBooking: json['isBooking'] as int,
    );

Map<String, dynamic> _$AVTimeModelToJson(AVTimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'work_time_id': instance.work_time_id,
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      'isBooking': instance.isBooking,
    };
