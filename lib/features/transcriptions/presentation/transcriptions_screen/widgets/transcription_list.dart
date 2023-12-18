part of '../transcriptions_screen.dart';

class TranscriptionsList extends StatelessWidget {
  const TranscriptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<TranscriptsCubit, TranscriptsState>(
      builder: (context, state) {
        if (state is TranscriptsSuccess) {
          return state.transcriptions.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: l10n.transcriptsTitle,
                        style: Theme.of(context).textTheme.titleSmall!,
                      ),
                    ),
                    const SizedBox(height: size),
                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: size * 2),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.transcriptions.length < 3
                          ? state.transcriptions.length
                          : 3,
                      itemBuilder: (BuildContext context, int index) {
                        return TranscriptionText(
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
