import "package:hive/hive.dart";
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'auth.g.dart';

@HiveType(typeId: 10)
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake, explicitToJson: false)
class AuthModel {
  @HiveField(0)
  String message;
  @HiveField(1)
  String token;

  AuthModel({
    @required this.message,
    @required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}