import 'package:consultation_project/models/auth/user_model.dart';
import 'package:consultation_project/models/consultations/type_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relationships_model.g.dart';

@JsonSerializable()
class RelationShipModel {
  UserModel user;
  TypeModel type;

  RelationShipModel({
    required this.user,
    required this.type,
  });

  factory RelationShipModel.fromJson(Map<String, dynamic> json) =>
      _$RelationShipModelFromJson(json);

  Map<String, dynamic> toJson() => _$RelationShipModelToJson(this);
}
