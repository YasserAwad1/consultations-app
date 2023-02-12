import 'package:consultation_project/models/auth/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part'expert_attributes_model.g.dart';

@JsonSerializable()
class ExpertAttributesModel {
  final String first_name;
  final String last_name;
  final String email;
  final int? role_id;

  final String? address;
  final String? phone;
  final String? image;
  final double? bag;
  final int? rate;

  ExpertAttributesModel(
      {required this.first_name,
      required this.last_name,
      required this.email,
      this.role_id,
      this.address,
      this.phone,
      this.image,
      this.bag,
      this.rate});

       factory ExpertAttributesModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertAttributesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpertAttributesModelToJson(this);
}
