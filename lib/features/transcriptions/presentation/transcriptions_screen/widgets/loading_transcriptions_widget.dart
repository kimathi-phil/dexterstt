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
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: kGreyColor900,
                ),
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
            child: Shimmer.fromColors(
              baseColor: kPrimaryColor,
              highlightColor: kGreyColor500,
              child: Image.asset(
                ImageAssets.logo,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
