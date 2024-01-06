// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_poster_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewPosterModelAdapter extends TypeAdapter<NewPosterModel> {
  @override
  final int typeId = 0;

  @override
  NewPosterModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewPosterModel(
      id: fields[0] as int,
      title: fields[1] as String,
      desc: fields[2] as String,
      images: (fields[3] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, NewPosterModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewPosterModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
