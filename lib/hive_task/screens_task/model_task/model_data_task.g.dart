// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_data_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatasAdapter extends TypeAdapter<Datas> {
  @override
  final int typeId = 9;

  @override
  Datas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datas(
      title: fields[9] as String,
      discription: fields[10] as String,
    )..ischecked = fields[11] as bool;
  }

  @override
  void write(BinaryWriter writer, Datas obj) {
    writer
      ..writeByte(3)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.discription)
      ..writeByte(11)
      ..write(obj.ischecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
