import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class StaticColors {
  static const black = Color(0xFF000000);
  static const blueWhale = Color(0xFF0C1324);
  static const white = Color(0xFFFFFFFF);
  static const limeBlue = Color(0xFF8D80C1);
  static const vividCerulean = Color(0xFFEB2D69);
  static const midnight = Color(0xFF242B3A);
  static const raven = Color(0xFF6D717C);
  static const aluminium = Color(0xFF858991);
  static const solitude = Color(0xFFF5F6F8);
  static const bittersweet = Color(0xFFFF5F5F);
  static const speechGreen = Color(0xFF1AE209);
  static const limeGreen = Color(0xFF34AD40);
  static const viking = Color(0xFF41B0B7);
  static const whiteLilac = Color(0xFFE7E7E9);
  static const mahogany = Color(0xFFC93E3E);
  static const snow = Color(0xFFFFEFEF);
  static const lavender = Color(0xFFF3FAFD);
  static const backgrounColor = Color(0xffF3F0FF);
  static const textFieldHint = Color(0xFF1B1F24);
}

@singleton
class DefaultThemeColors {
  final primary = StaticColors.vividCerulean;
  final primary01 = StaticColors.vividCerulean.withOpacity(0.1);
  final primary02 = StaticColors.vividCerulean.withOpacity(0.2);
  final primary005 = StaticColors.vividCerulean.withOpacity(0.05);
  final onPrimary = StaticColors.white;
  final primary2 = StaticColors.limeBlue;
  final black = StaticColors.black;
  final headline = StaticColors.blueWhale;
  final greenHeadline = StaticColors.limeGreen;
  final window = StaticColors.solitude;
  final window05 = StaticColors.solitude.withOpacity(0.5);
  final label = StaticColors.midnight;
  final title = StaticColors.raven;
  final title01 = StaticColors.raven.withOpacity(0.1);
  final errorColor = StaticColors.bittersweet;
  final display = StaticColors.aluminium;
  final avatarMain = StaticColors.speechGreen;
  final avatarSecond = StaticColors.viking;
  final grey = StaticColors.whiteLilac;
  final grey05 = StaticColors.whiteLilac.withOpacity(0.5);
  final disable = StaticColors.vividCerulean.withOpacity(0.15);
  final warningDark = StaticColors.mahogany;
  final warningLight = StaticColors.snow;
  final lightBlue = StaticColors.lavender;
  final backgrounColor = Color(0xffF3F0FF);
}
