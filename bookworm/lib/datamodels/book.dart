import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'book.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(
    nullable: false, fieldRename: FieldRename.snake, explicitToJson: false)
class BookModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String author;
  @HiveField(2)
  String genre;
  @HiveField(3)
  String description;
  @HiveField(4)
  String thumbUrl;
  @HiveField(5)
  String fileUrl;
  @HiveField(6)
  bool isExternal;

  BookModel({
    @required this.title,
    @required this.author,
    @required this.genre,
    @required this.description,
    @required this.thumbUrl,
    @required this.fileUrl,
    @required this.isExternal,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
