part of '../transcriptions_screen.dart';

class TranscriptionCard extends StatelessWidget {
  const TranscriptionCard({super.key, required this.transcript});

  final Transcript transcript;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: size * 12.0,
        minHeight: size * 4.0,
        maxWidth: size * 15.0,
        maxHeight: size * 10.0,
      ),
      padding: const EdgeInsets.all(size * 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(size + 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            transcript.transcription,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kWhiteColor,
                ),
          ),
        ],
      ),
    );
  }
}
