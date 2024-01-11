// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hakj_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GudfModelAdapter extends TypeAdapter<GudfModel> {
  @override
  final int typeId = 4;

  @override
  GudfModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GudfModel(
      dadfUrl: fields[0] as String,
      sldkfOp: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GudfModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dadfUrl)
      ..writeByte(1)
      ..write(obj.sldkfOp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GudfModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
