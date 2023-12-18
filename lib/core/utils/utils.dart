import 'package:permission_handler/permission_handler.dart';

Future<void> requestStoragePermission() async {
  final status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}

Future<void> requestMicrophonePermission() async {
  final status = await Permission.microphone.status;
  if (!status.isGranted) {
    await Permission.microphone.request();
  }
}
