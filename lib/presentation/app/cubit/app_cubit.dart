import 'package:flutter/material.dart';
import 'package:girls_care/common/base/base_cubit.dart';
import 'package:injectable/injectable.dart';

import 'app_state.dart';

@injectable
class AppCubit extends BaseCubit<AppBuildable, AppListenable> {
  AppCubit(t) : super(const AppBuildable()) {

  }

}
