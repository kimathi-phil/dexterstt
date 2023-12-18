part of 'transcriptions_cubit.dart';

abstract class TranscriptsState extends Equatable {
  const TranscriptsState();

  @override
  List<Object?> get props => [];
}

class TranscriptsInitial extends TranscriptsState {
  const TranscriptsInitial();
}

class TranscriptsLoading extends TranscriptsState {
  const TranscriptsLoading();
}

class TranscriptsSuccess extends TranscriptsState {
  const TranscriptsSuccess(this.transcriptions);
  final Transcripts transcriptions;

  @override
  List<Object?> get props => [transcriptions];
}

class TranscriptsMapSuccess extends TranscriptsState {
  const TranscriptsMapSuccess(this.transcripts);
  final Map<String, dynamic> transcripts;

  @override
  List<Object?> get props => [transcripts];
}

class TranscriptsFailed extends TranscriptsState {
  const TranscriptsFailed(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
