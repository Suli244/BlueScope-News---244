// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SavedModelAdapter extends TypeAdapter<SavedModel> {
  @override
  final int typeId = 1;

  @override
  SavedModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SavedModel(
      id: fields[0] as int,
      title: fields[1] as String,
      desciption: fields[2] as String,
      images: fields[3] as String,
      view: fields[4] as int,
      time: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SavedModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desciption)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.view)
      ..writeByte(5)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
