// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:logger/web.dart' as _i11;
import 'package:tsj_project/common/di/app_module.dart' as _i54;
import 'package:tsj_project/common/di/network_module.dart' as _i55;
import 'package:tsj_project/common/widget/display/display.dart' as _i6;
import 'package:tsj_project/common/widget/display/display_impl.dart' as _i7;
import 'package:tsj_project/data/auth_interceptor/auth_interceptor.dart'
    as _i10;
import 'package:tsj_project/data/base_model/default_theme_colors.dart' as _i3;
import 'package:tsj_project/data/storage/storage.dart' as _i5;
import 'package:tsj_project/domain/impl/auth_repositpry_impl.dart' as _i19;
import 'package:tsj_project/domain/impl/chat_repository_impl.dart' as _i21;
import 'package:tsj_project/domain/impl/home_repository_impl.dart' as _i32;
import 'package:tsj_project/domain/impl/news_repositpry_impl.dart' as _i25;
import 'package:tsj_project/domain/impl/profile_repository_impl.dart' as _i23;
import 'package:tsj_project/domain/repos/auth/auth_api.dart' as _i13;
import 'package:tsj_project/domain/repos/auth/auth_repository.dart' as _i18;
import 'package:tsj_project/domain/repos/chat/chat_api.dart' as _i14;
import 'package:tsj_project/domain/repos/chat/chat_repository.dart' as _i20;
import 'package:tsj_project/domain/repos/home/home_api.dart' as _i15;
import 'package:tsj_project/domain/repos/home/home_repository.dart' as _i31;
import 'package:tsj_project/domain/repos/news/news_api.dart' as _i16;
import 'package:tsj_project/domain/repos/news/news_repository.dart' as _i24;
import 'package:tsj_project/domain/repos/profile/profile_api.dart' as _i17;
import 'package:tsj_project/domain/repos/profile/profile_repository.dart'
    as _i22;
import 'package:tsj_project/presentation/app/cubit/app_cubit.dart' as _i33;
import 'package:tsj_project/presentation/auth/email_page/cubit/phone_input_cubit.dart'
    as _i34;
import 'package:tsj_project/presentation/auth/login/cubit/login_cubit.dart'
    as _i35;
import 'package:tsj_project/presentation/auth/password_page/cubit/create_password_cubit.dart'
    as _i36;
import 'package:tsj_project/presentation/auth/register/cubit/register_cubit.dart'
    as _i37;
import 'package:tsj_project/presentation/auth/verify/cubit/verify_cubit.dart'
    as _i38;
import 'package:tsj_project/presentation/chat/chat_messaging/cubit/chat_messaging.dart'
    as _i39;
import 'package:tsj_project/presentation/chat/chat_profile/cubit/chat_profile_cubi.dart'
    as _i40;
import 'package:tsj_project/presentation/main/add_feed/cubit/add_feed_cubit.dart'
    as _i26;
import 'package:tsj_project/presentation/main/lenta/cubit/lenta_cubit.dart'
    as _i27;
import 'package:tsj_project/presentation/main/list_chats/cubit/chat_cubit.dart'
    as _i41;
import 'package:tsj_project/presentation/main/my_home_base/domkom/cubit/damkom_cubit.dart'
    as _i49;
import 'package:tsj_project/presentation/main/my_home_base/info_page/cubit/info_cubit.dart'
    as _i50;
import 'package:tsj_project/presentation/main/my_home_base/my_applications/cubit/my_application_cubit.dart'
    as _i51;
import 'package:tsj_project/presentation/main/my_home_base/my_cameras/cubit/camera_cubit.dart'
    as _i52;
import 'package:tsj_project/presentation/main/my_home_base/my_receipts/cubit/my_receipt_cubit.dart'
    as _i45;
import 'package:tsj_project/presentation/main/my_home_base/tsj/cubit/tsj_cubit.dart'
    as _i53;
import 'package:tsj_project/presentation/main/news_detail/cubit/news_detail_cubit.dart'
    as _i28;
import 'package:tsj_project/presentation/main/notifcation/cubit/notification_cubit.dart'
    as _i42;
import 'package:tsj_project/presentation/main/profile_basse/add_liver/cubit/add_liver_cubit.dart'
    as _i46;
import 'package:tsj_project/presentation/main/profile_basse/notification/cubit/notification_cubit.dart'
    as _i44;
import 'package:tsj_project/presentation/main/profile_basse/passwords/cubit/password_cubit.dart'
    as _i47;
import 'package:tsj_project/presentation/main/profile_basse/profile/cubit/profile_cubit.dart'
    as _i48;
import 'package:tsj_project/presentation/main/search/cubit/search_cubit.dart'
    as _i29;
import 'package:tsj_project/presentation/main/search/search_chat/cubit/search_chat_cubit.dart'
    as _i43;
import 'package:tsj_project/presentation/main/votes_detail/cubit/add_vote_cubit.dart'
    as _i30;
import 'package:tsj_project/presentation/start/onboarding/cubit/onboarding_cubit.dart'
    as _i8;
import 'package:tsj_project/presentation/start/splash/cubit/splash_cubit.dart'
    as _i9;

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
    gh.factory<_i8.OnboardingCubit>(
        () => _i8.OnboardingCubit(gh<_i5.Storage>()));
    gh.factory<_i9.SplashCubit>(() => _i9.SplashCubit(gh<_i5.Storage>()));
    gh.lazySingleton<_i10.AuthInterceptor>(() => _i10.AuthInterceptor(
          gh<_i5.Storage>(),
          gh<_i11.Logger>(),
        ));
    gh.factory<_i12.Dio>(() => networkModule.dio(gh<_i10.AuthInterceptor>()));
    gh.factory<_i13.AuthApi>(() => _i13.AuthApi(gh<_i12.Dio>()));
    gh.factory<_i14.ChatApi>(() => _i14.ChatApi(gh<_i12.Dio>()));
    gh.factory<_i15.HomeApi>(() => _i15.HomeApi(gh<_i12.Dio>()));
    gh.factory<_i16.NewsApi>(() => _i16.NewsApi(gh<_i12.Dio>()));
    gh.factory<_i17.ProfileApi>(() => _i17.ProfileApi(gh<_i12.Dio>()));
    gh.factory<_i18.AuthRepository>(() => _i19.AuthRepositoryImpl(
          gh<_i13.AuthApi>(),
          gh<_i5.Storage>(),
        ));
    gh.factory<_i20.ChatRepository>(() => _i21.ChatRepositoryImpl(
          gh<_i14.ChatApi>(),
          gh<_i5.Storage>(),
        ));
    gh.factory<_i22.ProfileRepository>(() => _i23.ProfileRepositoryImpl(
          gh<_i17.ProfileApi>(),
          gh<_i5.Storage>(),
        ));
    gh.factory<_i24.NewsRepository>(() => _i25.NewsRepositoryImpl(
          gh<_i16.NewsApi>(),
          gh<_i5.Storage>(),
          gh<_i17.ProfileApi>(),
        ));
    gh.factory<_i26.AddFeedCubit>(
        () => _i26.AddFeedCubit(gh<_i24.NewsRepository>()));
    gh.factory<_i27.LentaCubit>(
        () => _i27.LentaCubit(gh<_i24.NewsRepository>()));
    gh.factory<_i28.NewsDetailCubit>(
        () => _i28.NewsDetailCubit(gh<_i24.NewsRepository>()));
    gh.factory<_i29.SearchCubit>(
        () => _i29.SearchCubit(gh<_i24.NewsRepository>()));
    gh.factory<_i30.AddVoteCubit>(
        () => _i30.AddVoteCubit(gh<_i24.NewsRepository>()));
    gh.factory<_i31.HomeRepository>(() => _i32.HomeRepositoryImpl(
          gh<_i15.HomeApi>(),
          gh<_i5.Storage>(),
        ));
    gh.factory<_i33.AppCubit>(() => _i33.AppCubit(gh<_i18.AuthRepository>()));
    gh.factory<_i34.PhoneInputCubit>(
        () => _i34.PhoneInputCubit(gh<_i18.AuthRepository>()));
    gh.factory<_i35.LoginCubit>(
        () => _i35.LoginCubit(gh<_i18.AuthRepository>()));
    gh.factory<_i36.CreatePasswordCubit>(
        () => _i36.CreatePasswordCubit(gh<_i18.AuthRepository>()));
    gh.factory<_i37.RegisterCubit>(
        () => _i37.RegisterCubit(gh<_i18.AuthRepository>()));
    gh.factory<_i38.VerifyCubit>(
        () => _i38.VerifyCubit(gh<_i18.AuthRepository>()));
    gh.factory<_i39.ChatMessagingCubit>(
        () => _i39.ChatMessagingCubit(gh<_i20.ChatRepository>()));
    gh.factory<_i40.ChatProfileCubit>(
        () => _i40.ChatProfileCubit(gh<_i20.ChatRepository>()));
    gh.factory<_i41.ChatCubit>(() => _i41.ChatCubit(gh<_i20.ChatRepository>()));
    gh.factory<_i42.NotificationsCubit>(
        () => _i42.NotificationsCubit(gh<_i20.ChatRepository>()));
    gh.factory<_i43.SearchChatCubit>(
        () => _i43.SearchChatCubit(gh<_i20.ChatRepository>()));
    gh.factory<_i44.MyNotificationCubit>(
        () => _i44.MyNotificationCubit(gh<_i20.ChatRepository>()));
    gh.factory<_i45.MyReceiptCubit>(
        () => _i45.MyReceiptCubit(gh<_i22.ProfileRepository>()));
    gh.factory<_i46.AddLiverCubit>(
        () => _i46.AddLiverCubit(gh<_i22.ProfileRepository>()));
    gh.factory<_i47.PasswordCubit>(
        () => _i47.PasswordCubit(gh<_i22.ProfileRepository>()));
    gh.factory<_i48.ProfileCubit>(
        () => _i48.ProfileCubit(gh<_i22.ProfileRepository>()));
    gh.factory<_i49.DamkomHomeCubit>(
        () => _i49.DamkomHomeCubit(gh<_i31.HomeRepository>()));
    gh.factory<_i50.InfoCubit>(() => _i50.InfoCubit(gh<_i31.HomeRepository>()));
    gh.factory<_i51.MyApplicationCubit>(
        () => _i51.MyApplicationCubit(gh<_i31.HomeRepository>()));
    gh.factory<_i52.CameraCubit>(
        () => _i52.CameraCubit(gh<_i31.HomeRepository>()));
    gh.factory<_i53.TsjCubit>(() => _i53.TsjCubit(gh<_i31.HomeRepository>()));
    return this;
  }
}

class _$AppModule extends _i54.AppModule {}

class _$NetworkModule extends _i55.NetworkModule {}
