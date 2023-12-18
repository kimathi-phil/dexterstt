part of '../transcriptions_screen.dart';

class EmptyTranscriptionsWidget extends StatelessWidget {
  @visibleForTesting
  const EmptyTranscriptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'There are no transcripts at the moment',
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
        SizedBox(height: size * 2),
        Center(
          child: Container(
            constraints: const BoxConstraints(
              minWidth: size * 12.0,
              minHeight: size * 4.0,
              maxWidth: size * 15.0,
              maxHeight: size * 10.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Icon(
                    Icons.block_rounded,
                    color: kGreyColor700,
                    size: size * 6,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
