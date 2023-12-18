// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';
import '../data.dart';

@LazySingleton(as: TranscriptsRepository)
class TranscriptsRepositoryImpl implements TranscriptsRepository {
  final TranscriptsRemoteSource _transcriptsRemoteSource;
  final TranscriptsLocalSource _transcriptsLocalSource;

  const TranscriptsRepositoryImpl(
    this._transcriptsRemoteSource,
    this._transcriptsLocalSource,
  );

  @override
  Future<Either<Exception, Transcripts>> sendAudioGetTranscript({
    required String filePath,
  }) async {
    final response = await _transcriptsRemoteSource.sendAudioGetTranscript(
      path: filePath,
    );

    return response.fold(left, _saveTranscript);
  }

  @override
  Future<Either<Exception, Transcripts>> getAllTranscripts() async {
    try {
      final response = await _getTranscripts();
      return right(response);
    } on DioException catch (error) {
      return left(
        error,
      );
    }
  }

  FutureOr<Either<Exception, Transcripts>> _saveTranscript(
      TranscriptDto transcript) async {
    await _transcriptsLocalSource.saveTranscript(transcript);
    return right(await _getTranscripts());
  }

  Future<Transcripts> _getTranscripts() async {
    final storedTranscripts = await _transcriptsLocalSource.getTranscriptions();
    return storedTranscripts.map((dto) => dto!.toEntity()).toList();
  }
}
