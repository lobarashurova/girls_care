import 'package:flutter/cupertino.dart';
import 'package:girls_care/data/base_model/default_theme_colors.dart';

import '../di/injection.dart';

extension ThemeContextExtensions on BuildContext {
  DefaultThemeColors get colors => getIt<DefaultThemeColors>();
}
