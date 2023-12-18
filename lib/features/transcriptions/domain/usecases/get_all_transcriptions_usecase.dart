import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecases.dart';
import '../entities/transcription.dart';
import '../repositories/transcriptions_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllTranscriptsUseCase implements UseCaseTwoResults<Transcripts, String> {
  GetAllTranscriptsUseCase(this._transcriptsRepository);

  final TranscriptsRepository _transcriptsRepository;

  @override
  Future<Either<String, Transcripts>> call({required String params}) async {
    final eitherResult = await _transcriptsRepository.getAllTranscripts();

    return eitherResult.fold(
      (exception) => Left(_mapExceptionToString(exception)),
      (transcript) => Right(transcript),
    );
  }

  String _mapExceptionToString(Exception e) {
    return e.toString();
  }
}
