import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final int role_id;
  bool isFavorite = false;

  final int? id;
  final String? address;
  final String? phone;
  final String? image;
  final double? wallet;
  final int? rate;

  UserModel(
      {required this.first_name,
      required this.last_name,
      required this.email,
      required this.password,
      required this.role_id,
      this.id,
      this.address,
      this.phone,
      this.image,
      this.wallet,
      this.rate});

      toggleFavoriteStatus(){
        isFavorite = !isFavorite;
      }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, String> toJson() => _$UserModelToJson(this);
}
