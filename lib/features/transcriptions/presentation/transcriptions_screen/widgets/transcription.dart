part of '../transcriptions_screen.dart';

class TranscriptionText extends StatelessWidget {
  const TranscriptionText({super.key, required this.transcript});

  final Transcript transcript;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          transcript.transcription,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
        SizedBox(height: size),
        Divider(height: size, color: kBlackColor900),
      ],
    );
  }
}
