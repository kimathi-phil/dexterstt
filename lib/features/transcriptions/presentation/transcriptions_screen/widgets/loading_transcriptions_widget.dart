part of '../transcriptions_screen.dart';

class LoadingTranscriptionsWidget extends StatelessWidget {
  @visibleForTesting
  const LoadingTranscriptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Loading transcripts..',
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
        SizedBox(height: size * 2),
        Center(
          child: Container(
            width: size * 4.0,
            height: size * 4.0,
            child: CircularProgressIndicator(color: kGreyColor900),
          ),
        ),
      ],
    );
  }
}
