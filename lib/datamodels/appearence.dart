import "package:hive/hive.dart";
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'appearence.g.dart';

@HiveType(typeId: 0)
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake, explicitToJson: false)
class AppearenceModel {
  @HiveField(0)
  String languageCode;
  @HiveField(1)
  double scaleFactor;
  @HiveField(2)
  bool darkMode;

  AppearenceModel({
    @required this.languageCode,
    @required this.scaleFactor,
    @required this.darkMode,
  });

  factory AppearenceModel.fromJson(Map<String, dynamic> json) => _$AppearenceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppearenceModelToJson(this);
}
