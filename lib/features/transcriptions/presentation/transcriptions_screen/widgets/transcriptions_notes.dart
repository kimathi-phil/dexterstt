part of '../transcriptions_screen.dart';

class TranscriptionsNotes extends StatelessWidget {
  const TranscriptionsNotes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: size * 4.4),
        Text(
          l10n.notesTitle,
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
        const SizedBox(height: size * 2.2),
        Text(
          l10n.noteText1,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        const SizedBox(height: 1),
        Text(
          l10n.noteText2,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        const SizedBox(height: size / 6),
        Text(
          l10n.noteText3,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
        const SizedBox(height: size / 6),
        Text(
          l10n.noteText4,
          style: Theme.of(context).textTheme.titleMedium!,
        ),
      ],
    );
  }
}
