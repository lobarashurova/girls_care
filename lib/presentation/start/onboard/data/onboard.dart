import 'package:flutter/material.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

enum Onboard {
  first,
  second,
  third,
}

extension LanguageExtensions on Onboard {
  String get title {
    switch (this) {
      case Onboard.first:
        return "Mattis sagittis malesuada quis et ultricies vehicula.";
      case Onboard.second:
        return "Mattis sagittis malesuada quis et ultricies vehicula.";
      case Onboard.third:
        return "Mattis sagittis malesuada quis et ultricies vehicula.";
    }
  }

  Widget get icon {
    switch (this) {
      case Onboard.first:
        return Assets.icons.onboard1.image(height: 300);
      case Onboard.second:
        return Assets.icons.onboard2.image(height: 300);
      case Onboard.third:
        return Assets.icons.onboard3.image(height: 300);
    }
  }

  String get description {
    switch (this) {
      case Onboard.first:
        return "Все решения по дому, голосования и новости не мешаются с рабочими или личными группами в ваших мессенджерах";
      case Onboard.second:
        return "Удобные голосования прямо в приложении, оповещения для администрации ТСЖ";
      case Onboard.third:
        return "Срочные оповещения жителей в случае экстренных ситуаций";
    }
  }
}
