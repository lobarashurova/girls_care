/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_launcher.png
  AssetGenImage get appLauncher =>
      const AssetGenImage('assets/icons/app_launcher.png');

  /// File path: assets/icons/arrow.svg
  SvgGenImage get arrow => const SvgGenImage('assets/icons/arrow.svg');

  /// File path: assets/icons/camera_rounded.svg
  SvgGenImage get cameraRounded =>
      const SvgGenImage('assets/icons/camera_rounded.svg');

  /// File path: assets/icons/chat_icon.svg
  SvgGenImage get chatIcon => const SvgGenImage('assets/icons/chat_icon.svg');

  /// File path: assets/icons/checked.svg
  SvgGenImage get checked => const SvgGenImage('assets/icons/checked.svg');

  /// File path: assets/icons/close.svg
  SvgGenImage get close => const SvgGenImage('assets/icons/close.svg');

  /// File path: assets/icons/draft_rounded.svg
  SvgGenImage get draftRounded =>
      const SvgGenImage('assets/icons/draft_rounded.svg');

  /// File path: assets/icons/edit_prof.png
  AssetGenImage get editProf =>
      const AssetGenImage('assets/icons/edit_prof.png');

  /// File path: assets/icons/empty.png
  AssetGenImage get empty => const AssetGenImage('assets/icons/empty.png');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/home_rounded.svg
  SvgGenImage get homeRounded =>
      const SvgGenImage('assets/icons/home_rounded.svg');

  /// File path: assets/icons/image.png
  AssetGenImage get image => const AssetGenImage('assets/icons/image.png');

  /// File path: assets/icons/incorrect.svg
  SvgGenImage get incorrect => const SvgGenImage('assets/icons/incorrect.svg');

  /// File path: assets/icons/info_profile.svg
  SvgGenImage get infoProfile =>
      const SvgGenImage('assets/icons/info_profile.svg');

  /// File path: assets/icons/info_rounded.svg
  SvgGenImage get infoRounded =>
      const SvgGenImage('assets/icons/info_rounded.svg');

  /// File path: assets/icons/information.svg
  SvgGenImage get information =>
      const SvgGenImage('assets/icons/information.svg');

  /// File path: assets/icons/innpay.png
  AssetGenImage get innpay => const AssetGenImage('assets/icons/innpay.png');

  /// File path: assets/icons/lenta_icon.svg
  SvgGenImage get lentaIcon => const SvgGenImage('assets/icons/lenta_icon.svg');

  /// File path: assets/icons/login_pic.png
  AssetGenImage get loginPic =>
      const AssetGenImage('assets/icons/login_pic.png');

  /// File path: assets/icons/logo_splash.png
  AssetGenImage get logoSplash =>
      const AssetGenImage('assets/icons/logo_splash.png');

  /// File path: assets/icons/notification_profile.svg
  SvgGenImage get notificationProfile =>
      const SvgGenImage('assets/icons/notification_profile.svg');

  /// File path: assets/icons/onboard1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/icons/onboard1.png');

  /// File path: assets/icons/onboard2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/icons/onboard2.png');

  /// File path: assets/icons/onboard3.png
  AssetGenImage get onboard3 =>
      const AssetGenImage('assets/icons/onboard3.png');

  /// File path: assets/icons/password_profile.svg
  SvgGenImage get passwordProfile =>
      const SvgGenImage('assets/icons/password_profile.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/saved_rounded.svg
  SvgGenImage get savedRounded =>
      const SvgGenImage('assets/icons/saved_rounded.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// File path: assets/icons/send_icon.svg
  SvgGenImage get sendIcon => const SvgGenImage('assets/icons/send_icon.svg');

  /// File path: assets/icons/splash_col.png
  AssetGenImage get splashCol =>
      const AssetGenImage('assets/icons/splash_col.png');

  /// File path: assets/icons/translator_profile.svg
  SvgGenImage get translatorProfile =>
      const SvgGenImage('assets/icons/translator_profile.svg');

  /// File path: assets/icons/verify.png
  AssetGenImage get verify => const AssetGenImage('assets/icons/verify.png');

  /// List of all assets
  List<dynamic> get values => [
        appLauncher,
        arrow,
        cameraRounded,
        chatIcon,
        checked,
        close,
        draftRounded,
        editProf,
        empty,
        home,
        homeRounded,
        image,
        incorrect,
        infoProfile,
        infoRounded,
        information,
        innpay,
        lentaIcon,
        loginPic,
        logoSplash,
        notificationProfile,
        onboard1,
        onboard2,
        onboard3,
        passwordProfile,
        profile,
        savedRounded,
        search,
        sendIcon,
        splashCol,
        translatorProfile,
        verify
      ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/animation_loading.json
  String get animationLoading => 'assets/lotties/animation_loading.json';

  /// File path: assets/lotties/loading_lottie.json
  String get loadingLottie => 'assets/lotties/loading_lottie.json';

  /// File path: assets/lotties/splash.json
  String get splash => 'assets/lotties/splash.json';

  /// List of all assets
  List<String> get values => [animationLoading, loadingLottie, splash];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
