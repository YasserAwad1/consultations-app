// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkTimeModel _$WorkTimeModelFromJson(Map<String, dynamic> json) =>
    WorkTimeModel(
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      day_id: json['day_id'] as int,
      time_end: json['time_end'] as String,
      time_start: json['time_start'] as String,
      day: json['day'] == null
          ? null
          : DayModel.fromJson(json['day'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkTimeModelToJson(WorkTimeModel instance) =>
    <String, dynamic>{
      if(instance.id !=null) 'id': instance.id,
      if(instance.user_id != null) 'user_id': instance.user_id,
      'day_id': instance.day_id.toString(),
      'time_start': instance.time_start,
      'time_end': instance.time_end,
      if(instance.day != null) 'day': instance.day,
    };
