import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int? id;
  Map<String, dynamic> attributes;
  Map<String, dynamic> relationships;

  CategoryModel({
    this.id,
    required this.attributes,
    required this.relationships,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
