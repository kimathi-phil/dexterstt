import 'dart:async';
import 'dart:developer';
import 'package:dexterstt/config/config.dart';

import 'package:record/record.dart';

class Recorder {
  final AudioRecorder _audioRecorder = AudioRecorder();
  bool _isRecording = false;

  Future<void> startRecording() async {
    try {
      const encoder = AudioEncoder.wav;
      const config = RecordConfig(encoder: encoder, numChannels: 1);

      if (!await isRecording()) {
        await _audioRecorder.start(config, path: filePath);
      }
    } catch (e) {
      log("Error: ${e}");
    }
  }

  Future<String?> stopRecording() async {
    try {
      if (await isRecording()) {
        return await _audioRecorder.stop();
      }
    } catch (e) {
      log("Error: ${e}");
    }
    return "nunsone";
  }

  Future<bool> isRecording() async {
    _isRecording = await _audioRecorder.isRecording();
    return _isRecording;
  }
}
