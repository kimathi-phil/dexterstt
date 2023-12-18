
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../features/transcriptions/data/data.dart';


@module
abstract class StorageModule {
  @preResolve
  @lazySingleton
  @Named('transcriptsBox')
  Future<Box<TranscriptDto>> get albumBox {
    return Hive.openBox<TranscriptDto>('transcriptsBox');
  }
}
