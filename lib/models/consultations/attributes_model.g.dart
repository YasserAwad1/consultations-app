// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributesModel _$AttributesModelFromJson(Map<String, dynamic> json) =>
    AttributesModel(
      excerpt: json['excerpt'] as String,
      body: json['body'] as String,
      rate: (json['rate']as num?)?.toDouble(),
      price: (json['price'] as num).toDouble() ,
      consultation_time: '',
      number_of_rating: (json['number_of_rating'] as num?)?.toDouble(),
      consultationType_id: json['consultationType_id'] as int?,
    );

Map<String, dynamic> _$AttributesModelToJson(AttributesModel instance) =>
    <String, dynamic>{
      'excerpt': instance.excerpt,
      'body': instance.body,
      if(instance.rate != null) 'rate': instance.rate,
      'price': instance.price.toString(),
      if(instance.consultation_time != null)'consultation_time': instance.consultation_time,
      if(instance.number_of_rating != null)'number_of_rating': instance.number_of_rating,
      'consultation_type_id': instance.consultationType_id.toString(),
    };