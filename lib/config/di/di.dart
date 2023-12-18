import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../features/transcriptions/data/data.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init')
Future<void> configureDependencies() async {
  _configureHiveTypeAdapters();
  await getIt.init();
}

void _configureHiveTypeAdapters() {
  Hive.registerAdapter(TranscriptDtoAdapter());
}
