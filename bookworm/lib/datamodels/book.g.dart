// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 3;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      title: fields[0] as String,
      author: fields[1] as String,
      genre: fields[2] as String,
      description: fields[3] as String,
      thumbUrl: fields[4] as String,
      fileUrl: fields[5] as String,
      isExternal: fields[6] as bool,
      isCached: fields[7] as bool,
      storedUrl: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.genre)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.thumbUrl)
      ..writeByte(5)
      ..write(obj.fileUrl)
      ..writeByte(6)
      ..write(obj.isExternal)
      ..writeByte(7)
      ..write(obj.isCached)
      ..writeByte(8)
      ..write(obj.storedUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    title: json['title'] as String,
    author: json['author'] as String,
    genre: json['genre'] as String,
    description: json['description'] as String,
    thumbUrl: json['thumb_url'] as String,
    fileUrl: json['file_url'] as String,
    isExternal: json['is_external'] as bool,
    isCached: json['is_cached'] as bool,
    storedUrl: json['stored_url'] as String,
  );
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'genre': instance.genre,
      'description': instance.description,
      'thumb_url': instance.thumbUrl,
      'file_url': instance.fileUrl,
      'is_external': instance.isExternal,
      'is_cached': instance.isCached,
      'stored_url': instance.storedUrl,
    };
