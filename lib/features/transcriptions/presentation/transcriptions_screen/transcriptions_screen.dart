import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/config.dart';
import '../../../../config/di/di.dart';
import '../../../../l10n/l10n.dart';
import '../../../shared/data/recorder/recorder.dart';
import '../../domain/entities/entities.dart';
import '../../transcripts.dart';

part 'widgets/empty_transcriptions_widget.dart';
part 'widgets/loading_transcriptions_widget.dart';
part 'widgets/transcription.dart';
part 'widgets/transcription_list.dart';
part 'widgets/transcriptions_api_counter.dart';
part 'widgets/transcriptions_notes.dart';
part 'widgets/transcriptions_screen_navbar.dart';

class TranscriptsScreen extends StatelessWidget {
  const TranscriptsScreen({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TranscriptsCubit>()..getAllTranscripts(path),
      child: Scaffold(
        backgroundColor: kGreyColor100,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: size * 2),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: size * 2),
                  const TranscriptionsScreenNavbar(),
                  const TranscriptionsNotes(),
                  TranscriptionsCounter(),
                  const SizedBox(height: size + 4),
                  const TranscriptionsList(),
                  const SizedBox(height: size * 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  RichText getTItle(BuildContext context, AppLocalizations l10n) {
    return RichText(
      text: TextSpan(
        text: 'Latest transcriptions',
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: kGreyColor900,
            ),
      ),
    );
  }
}
