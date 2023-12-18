import 'package:equatable/equatable.dart';

typedef Transcripts = List<Transcript>;

class Transcript extends Equatable {
  const Transcript({
    required this.transcription,
  });

  final String transcription;

  @override
  List<Object?> get props => [
        transcription,
      ];
}
