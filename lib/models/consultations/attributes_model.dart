import 'package:json_annotation/json_annotation.dart';

part 'attributes_model.g.dart';

@JsonSerializable()
class AttributesModel {
  // int id;
  String excerpt;
  String body;
  double? rate;
  double price;
  String? consultation_time;
  double? number_of_rating;

  int? consultationType_id;

  AttributesModel(
      {
      // required this.id,
      required this.excerpt,
      required this.body,
      this.rate,
      required this.price,
      this.consultation_time,
      this.number_of_rating,
      this.consultationType_id});

  factory AttributesModel.fromJson(Map<String, dynamic> json) =>
      _$AttributesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesModelToJson(this);
}
