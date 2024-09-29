import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

enum Onboard { first, second, third, fourth }

extension LanguageExtensions on Onboard {
  String get title {
    switch (this) {
      case Onboard.first:
        return "Hayz siklingizni kuzatib, simptomlarni yozib boring va eslatmalar oling.";
      case Onboard.second:
        return "Homiladorlikni haftalar bo'yicha kuzatib, bola rivojlanishini va sog'lig'ingizni nazorat qiling.";
      case Onboard.third:
        return "Tug'ruqdan keyin tiklanish va bola parvarishini nazorat qiling.";
      case Onboard.fourth:
        return "Menopauza simptomlarini kuzatib, foydali maslahatlar va maqolalar bilan tanishing.";
    }
  }

  Widget get icon {
    switch (this) {
      case Onboard.first:
        return Assets.icons.onboard1.image(height: 300.h);
      case Onboard.second:
        return Assets.icons.onboard2.image(height: 300.h);
      case Onboard.third:
        return Assets.icons.onboard3.image(height: 300.h);
      case Onboard.fourth:
        return Assets.icons.onboard4.image(height: 300.h);
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
      case Onboard.fourth:
        return "Срочные оповещения жителей в случае экстренных ситуаций";
    }
  }
}
