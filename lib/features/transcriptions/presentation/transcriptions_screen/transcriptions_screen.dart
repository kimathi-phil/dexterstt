import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:record/record.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/assets/assets.dart';
import '../../../../config/config.dart';
import '../../../../config/di/di.dart';
import '../../../../l10n/l10n.dart';
import '../../../shared/data/recorder/recorder.dart';
import '../../domain/entities/entities.dart';
import '../../transcripts.dart';
part 'widgets/transcriptions_mic_button.dart';

part 'widgets/empty_transcriptions_widget.dart';
part 'widgets/loading_transcriptions_widget.dart';
part 'widgets/transcription_card.dart';
part 'widgets/transcription_list.dart';
part 'widgets/transcriptions_screen_navbar.dart';
part 'widgets/transcriptions_counter.dart';

class TranscriptsScreen extends StatelessWidget {
  const TranscriptsScreen({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
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
                  const SizedBox(height: size + 4),
                  const TranscriptionsList(),
                  const SizedBox(height: size * 2),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TranscriptionsCounter(),
              TranscriptionsMicButton(
                iconData: Icons.mic,
                title: 'Always Listening',
                onBtnSelected: () {},
              ),
            ],
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
