import 'dart:core';
import 'dart:collection';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../dtos/transcription_dto.dart';

abstract class TranscriptsLocalSource {
  Future<TranscriptDto?> getTranscription(String id);
  Future<List<TranscriptDto?>> getTranscriptions();
  Future<TranscriptDto> saveTranscript(TranscriptDto transcript);
}

@Injectable(as: TranscriptsLocalSource)
class TranscriptsLocalSourceImpl implements TranscriptsLocalSource {
  final Box<TranscriptDto> _transcriptsBox;
  final int _maxTranscriptionCount = 3;

  TranscriptsLocalSourceImpl(
    @Named('transcriptsBox') this._transcriptsBox,
  );

  @override
  Future<TranscriptDto?> getTranscription(String id) async {
    return _transcriptsBox.get(id);
  }

  @override
  Future<List<TranscriptDto?>> getTranscriptions() async {
    final transcriptions = _transcriptsBox.values.toList();
    return transcriptions.take(_maxTranscriptionCount).toList();
  }

  @override
  Future<TranscriptDto> saveTranscript(TranscriptDto transcript) async {
    final existingTranscriptions = _transcriptsBox.values.toList();
    final updatedTranscriptions = Queue.of(existingTranscriptions)
      ..add(transcript);

    if (updatedTranscriptions.length > _maxTranscriptionCount) {
      updatedTranscriptions.removeFirst();
    }

    await _transcriptsBox.clear();
    for (final updatedTranscript in updatedTranscriptions) {
      await _transcriptsBox.put(updatedTranscript.id, updatedTranscript);
    }

    return transcript;
  }
}
