part of '../transcriptions_screen.dart';

class TranscriptionsList extends StatelessWidget {
  const TranscriptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranscriptsCubit, TranscriptsState>(
      builder: (context, state) {
        if (state is TranscriptsSuccess) {
          return state.transcriptions.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Last STT transcripts',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: kGreyColor900,
                            ),
                      ),
                    ),
                    const SizedBox(height: size * 2),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: size * 2),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.transcriptions.length < 3
                          ? state.transcriptions.length
                          : 3,
                      itemBuilder: (BuildContext context, int index) {
                        return TranscriptionCard(
                            transcript: state.transcriptions[index]);
                      },
                    ),
                  ],
                )
              : const EmptyTranscriptionsWidget();
        }
        return LoadingTranscriptionsWidget();
      },
    );
  }
}
