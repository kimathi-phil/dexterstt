import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/transcription.dart';

part 'transcription_dto.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TranscriptDto {
  @HiveField(0)
  String id;
  @HiveField(1)
  final String transcription;

  TranscriptDto({
    required this.id,
    required this.transcription,
  });

  factory TranscriptDto.fromJson(Map<String, dynamic> json) =>
      _$TranscriptDtoFromJson(json);

  Transcript toEntity() {
    return Transcript(
      transcription: transcription,
    );
  }
}
