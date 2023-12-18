part of '../transcriptions_screen.dart';

class TranscriptionsCounter extends StatefulWidget {
  @override
  _TranscriptionsCounterState createState() => _TranscriptionsCounterState();
}

class _TranscriptionsCounterState extends State<TranscriptionsCounter> {
  double progress = 0.0;
  late int startTime = 0;
  late int elapsedTime = 0;
  late int counter = 0;
  Timer? timer;
  final audioRecorder = Recorder();

  @override
  void initState() {
    super.initState();
    startTime = DateTime.now().millisecondsSinceEpoch;
    timer =
        Timer.periodic(Duration(milliseconds: 100), (_) => updateProgress());
    startRecording();
  }

  void startRecording() async {
    await audioRecorder.startRecording();
  }

  void stopRecording() async {
    await audioRecorder.stopRecording();
  }

  void updateProgress() {
    final now = DateTime.now().millisecondsSinceEpoch;
    elapsedTime = now - startTime;
    final totalTime = 5000;

    setState(() {
      progress = elapsedTime / totalTime;
    });

    if (elapsedTime >= totalTime) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TranscriptsCubit, TranscriptsState>(
      listener: (context, state) {
        if (state is TranscriptsSuccess) {
          counter += 1;
        }
      },
      child: FutureBuilder<void>(
        future: Future.delayed(Duration(seconds: 0), () async {
          if (elapsedTime >= 5000) {
            final path = await audioRecorder.stopRecording();
            log("path: $path");
            startTime = DateTime.now().millisecondsSinceEpoch;
            elapsedTime = 0;
            timer = Timer.periodic(
                Duration(milliseconds: 100), (_) => updateProgress());
            await context
                .read<TranscriptsCubit>()
                .sendAudioGetTranscripts(path!);
            setState(() {});
            startRecording();
          }
        }),
        builder: (context, snapshot) {
          final seconds = (elapsedTime ~/ 1000);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "API call counter",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kGreyColor900,
                      ),
                ),
                SizedBox(height: size / 2),
                Text(
                  "$counter",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
                SizedBox(height: size),
                Text(
                  "Recording time: ${seconds} secs",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: kGreyColor900,
                      ),
                ),
                SizedBox(height: size / 2),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                  height: size,
                  child: LinearProgressIndicator(
                    value: progress,
                    valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    backgroundColor: kGreyColor900,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(size * 6)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    stopRecording();
    super.dispose();
  }
}
