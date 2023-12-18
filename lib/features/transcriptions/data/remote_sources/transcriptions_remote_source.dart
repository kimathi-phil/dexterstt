import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../dtos/transcription_dto.dart';

typedef TranscriptRemoteResponse = Either<Exception, TranscriptDto>;

abstract class TranscriptsRemoteSource {
  Future<TranscriptRemoteResponse> sendAudioGetTranscript(
      {required String path});
}

@Injectable(as: TranscriptsRemoteSource)
class TranscriptRemoteSourceImpl implements TranscriptsRemoteSource {
  final Dio _dio;
  final _uuid = Uuid();

  TranscriptRemoteSourceImpl(this._dio);

  @override
  Future<TranscriptRemoteResponse> sendAudioGetTranscript(
      {required String path}) async {
    final String uniqueId = _uuid.v4();
    try {
      MultipartFile file = await MultipartFile.fromFile(path);
      FormData formData = await FormData.fromMap({
        'file': file,
      });

      final response = await _dio.post(
        '',
        data: formData,
      );
      final Map data = response.data!;
      return right(TranscriptDto.fromJson({
        'transcription': data['transcription'],
        'id': uniqueId,
      }));
    } on DioException catch (error) {
      return left(
        error,
      );
    }
  }
}
