import 'package:dartz/dartz.dart';

import '../entities/transcription.dart';

abstract class TranscriptsRepository {
  Future<Either<Exception, Transcripts>> sendAudioGetTranscript(
      {required String filePath});
  Future<Either<Exception, Transcripts>> getAllTranscripts();
}
