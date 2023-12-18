import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/transcription.dart';
import '../../domain/usecases/usecases.dart';

part 'transcriptions_state.dart';

@injectable
class TranscriptsCubit extends Cubit<TranscriptsState> {
  TranscriptsCubit(
    this._sendAudioGetTranscriptsUseCase,
    this._getAllTranscriptsUseCase,
  ) : super(const TranscriptsInitial());

  final SendAudioGetTranscriptsUseCase _sendAudioGetTranscriptsUseCase;
  final GetAllTranscriptsUseCase _getAllTranscriptsUseCase;

  @override
  Future<void> close() async {
    await super.close();
  }

  static TranscriptsCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllTranscripts(String filePath) async {
    emit(const TranscriptsLoading());
    final response = await _getAllTranscriptsUseCase(params: filePath);
    emit(response.fold(TranscriptsFailed.new, TranscriptsSuccess.new));
  }

  Future<void> sendAudioGetTranscripts(String filePath) async {
    emit(const TranscriptsLoading());
    final response = await _sendAudioGetTranscriptsUseCase(params: filePath);
    emit(response.fold(TranscriptsFailed.new, TranscriptsSuccess.new));
  }
}
