import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppBuildable with _$AppBuildable {
  const factory AppBuildable() = _AppBuildable;
}

@freezed
class AppListenable with _$AppListenable {
  const factory AppListenable() = _AppListenable;
}
