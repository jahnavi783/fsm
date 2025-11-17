// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatMessageHiveModelAdapter extends TypeAdapter<ChatMessageHiveModel> {
  @override
  final typeId = 15;

  @override
  ChatMessageHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessageHiveModel(
      id: fields[0] as String,
      sessionId: fields[1] as String,
      role: fields[2] as String,
      content: fields[3] as String,
      timestamp: fields[4] as DateTime,
      toolsUsed: (fields[5] as List?)?.cast<String>(),
      isSynced: fields[6] as bool,
      isPending: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ChatMessageHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sessionId)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.timestamp)
      ..writeByte(5)
      ..write(obj.toolsUsed)
      ..writeByte(6)
      ..write(obj.isSynced)
      ..writeByte(7)
      ..write(obj.isPending);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
