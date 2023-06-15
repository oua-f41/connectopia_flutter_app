// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_properties.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ApplicationPropertiesAdapter extends TypeAdapter<ApplicationProperties> {
  @override
  final int typeId = 0;

  @override
  ApplicationProperties read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ApplicationProperties(
      isNewUser: fields[0] as bool?,
      isDarkMode: fields[1] as bool?,
      locale: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ApplicationProperties obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.isNewUser)
      ..writeByte(1)
      ..write(obj.isDarkMode)
      ..writeByte(2)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApplicationPropertiesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
