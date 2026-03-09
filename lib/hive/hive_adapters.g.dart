// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class AllTasksModelAdapter extends TypeAdapter<AllTasksModel> {
  @override
  final typeId = 0;

  @override
  AllTasksModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllTasksModel(
      id: fields[0] as String?,
      date: fields[3] as String?,
      description: fields[2] as String?,
      endTime: fields[5] as String?,
      isCompleted: fields[6] as bool?,
      startTime: fields[4] as String?,
      title: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllTasksModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.startTime)
      ..writeByte(5)
      ..write(obj.endTime)
      ..writeByte(6)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllTasksModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
