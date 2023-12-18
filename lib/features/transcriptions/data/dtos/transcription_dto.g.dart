// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranscriptDtoAdapter extends TypeAdapter<TranscriptDto> {
  @override
  final int typeId = 0;

  @override
  TranscriptDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranscriptDto(
      id: fields[0] as String,
      transcription: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TranscriptDto obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.transcription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranscriptDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptDto _$TranscriptDtoFromJson(Map<String, dynamic> json) =>
    TranscriptDto(
      id: json['id'] as String,
      transcription: json['transcription'] as String,
    );

Map<String, dynamic> _$TranscriptDtoToJson(TranscriptDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transcription': instance.transcription,
    };
