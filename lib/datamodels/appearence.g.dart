// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearence.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppearenceModelAdapter extends TypeAdapter<AppearenceModel> {
  @override
  final int typeId = 0;

  @override
  AppearenceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppearenceModel(
      languageCode: fields[0] as String,
      scaleFactor: fields[1] as double,
      darkMode: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppearenceModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.languageCode)
      ..writeByte(1)
      ..write(obj.scaleFactor)
      ..writeByte(2)
      ..write(obj.darkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppearenceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppearenceModel _$AppearenceModelFromJson(Map<String, dynamic> json) {
  return AppearenceModel(
    languageCode: json['language_code'] as String,
    scaleFactor: (json['scale_factor'] as num).toDouble(),
    darkMode: json['dark_mode'] as bool,
  );
}

Map<String, dynamic> _$AppearenceModelToJson(AppearenceModel instance) =>
    <String, dynamic>{
      'language_code': instance.languageCode,
      'scale_factor': instance.scaleFactor,
      'dark_mode': instance.darkMode,
    };
