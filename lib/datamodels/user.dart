import "package:hive/hive.dart";
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@HiveType(typeId: 5)
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake, explicitToJson: false)
class UserModel {
  @HiveField(0)
  String email;
  @HiveField(1)
  String password;
  @HiveField(2)
  String token;

  UserModel({
    @required this.email,
    @required this.password,
    @required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}