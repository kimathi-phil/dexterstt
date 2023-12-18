// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dexterstt/config/di/modules/network_module.dart' as _i19;
import 'package:dexterstt/config/di/modules/storage_module.dart' as _i18;
import 'package:dexterstt/features/transcriptions/application/transcriptions/transcriptions_cubit.dart'
    as _i16;
import 'package:dexterstt/features/transcriptions/data/data.dart' as _i4;
import 'package:dexterstt/features/transcriptions/data/dtos/transcription_dto.dart'
    as _i8;
import 'package:dexterstt/features/transcriptions/data/local_sources/transcriptions_local_source.dart'
    as _i6;
import 'package:dexterstt/features/transcriptions/data/remote_sources/transcriptions_remote_source.dart'
    as _i10;
import 'package:dexterstt/features/transcriptions/data/repositories/transcriptions_repository_impl.dart'
    as _i12;
import 'package:dexterstt/features/transcriptions/domain/domain.dart' as _i11;
import 'package:dexterstt/features/transcriptions/domain/repositories/transcriptions_repository.dart'
    as _i14;
import 'package:dexterstt/features/transcriptions/domain/usecases/get_all_transcriptions_usecase.dart'
    as _i13;
import 'package:dexterstt/features/transcriptions/domain/usecases/send_audio_get_transcriptions_usecase.dart'
    as _i15;
import 'package:dexterstt/features/transcriptions/domain/usecases/usecases.dart'
    as _i17;
import 'package:dio/dio.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i7;
import 'package:hive_flutter/hive_flutter.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final networkModule = _$NetworkModule();
    await gh.lazySingletonAsync<_i3.Box<_i4.TranscriptDto>>(
      () => storageModule.albumBox,
      instanceName: 'transcriptsBox',
      preResolve: true,
    );
    gh.lazySingleton<_i5.PrettyDioLogger>(() => networkModule.prettyLogger);
    gh.factory<String>(
      () => networkModule.token,
      instanceName: 'Token',
    );
    gh.factory<String>(
      () => networkModule.baseHttpUrl,
      instanceName: 'BaseUrl',
    );
    gh.factory<_i6.TranscriptsLocalSource>(() => _i6.TranscriptsLocalSourceImpl(
        gh<_i7.Box<_i8.TranscriptDto>>(instanceName: 'transcriptsBox')));
    gh.lazySingleton<_i9.BaseOptions>(() => networkModule.dioBaseOptions(
          gh<String>(instanceName: 'BaseUrl'),
          gh<String>(instanceName: 'Token'),
        ));
    gh.lazySingleton<_i9.Dio>(() => networkModule.dio(
          gh<_i9.BaseOptions>(),
          gh<_i5.PrettyDioLogger>(),
        ));
    gh.factory<_i10.TranscriptsRemoteSource>(
        () => _i10.TranscriptRemoteSourceImpl(gh<_i9.Dio>()));
    gh.lazySingleton<_i11.TranscriptsRepository>(
        () => _i12.TranscriptsRepositoryImpl(
              gh<_i4.TranscriptsRemoteSource>(),
              gh<_i4.TranscriptsLocalSource>(),
            ));
    gh.lazySingleton<_i13.GetAllTranscriptsUseCase>(
        () => _i13.GetAllTranscriptsUseCase(gh<_i14.TranscriptsRepository>()));
    gh.lazySingleton<_i15.SendAudioGetTranscriptsUseCase>(() =>
        _i15.SendAudioGetTranscriptsUseCase(gh<_i14.TranscriptsRepository>()));
    gh.factory<_i16.TranscriptsCubit>(() => _i16.TranscriptsCubit(
          gh<_i17.SendAudioGetTranscriptsUseCase>(),
          gh<_i17.GetAllTranscriptsUseCase>(),
        ));
    return this;
  }
}

class _$StorageModule extends _i18.StorageModule {}

class _$NetworkModule extends _i19.NetworkModule {}
