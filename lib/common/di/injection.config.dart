// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:girls_care/common/di/app_module.dart' as _i13;
import 'package:girls_care/common/di/network_module.dart' as _i14;
import 'package:girls_care/common/widget/display/display.dart' as _i6;
import 'package:girls_care/common/widget/display/display_impl.dart' as _i7;
import 'package:girls_care/data/auth_interceptors/auth_interceptor.dart' as _i9;
import 'package:girls_care/data/base_model/default_theme_colors.dart' as _i3;
import 'package:girls_care/data/storage/storage.dart' as _i5;
import 'package:girls_care/presentation/app/cubit/app_cubit.dart' as _i11;
import 'package:girls_care/presentation/start/splash/cubit/splash_cubit.dart'
    as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:logger/web.dart' as _i10;

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
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule();
    gh.singleton<_i3.DefaultThemeColors>(() => _i3.DefaultThemeColors());
    gh.lazySingleton<_i4.Logger>(() => appModule.logger);
    await gh.lazySingletonAsync<_i5.Storage>(
      () => _i5.Storage.create(),
      preResolve: true,
    );
    gh.singleton<_i6.Display>(() => _i7.DisplayImpl());
    gh.factory<_i8.SplashCubit>(() => _i8.SplashCubit(gh<_i5.Storage>()));
    gh.lazySingleton<_i9.AuthInterceptor>(() => _i9.AuthInterceptor(
          gh<_i5.Storage>(),
          gh<_i10.Logger>(),
        ));
    gh.factory<_i11.AppCubit>(() => _i11.AppCubit(gh<dynamic>()));
    gh.factory<_i12.Dio>(() => networkModule.dio(gh<_i9.AuthInterceptor>()));
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}

class _$NetworkModule extends _i14.NetworkModule {}
