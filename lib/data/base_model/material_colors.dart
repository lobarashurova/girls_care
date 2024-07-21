import 'package:flutter/material.dart';

class MaterialColors {
  static const MaterialColor vividCerulean = MaterialColor(
    _vividCeruleanPrimaryValue,
    <int, Color>{
      50: Color(0xFFE1F3FC),
      100: Color(0xFFB5E2F6),
      200: Color(0xFF84CFF1),
      300: Color(0xFF53BBEB),
      400: Color(0xFF2EADE6),
      500: Color(_vividCeruleanPrimaryValue),
      600: Color(0xFF0896DF),
      700: Color(0xFF068CDA),
      800: Color(0xFF0582D6),
      900: Color(0xFF0270CF),
    },
  );
  static const int _vividCeruleanPrimaryValue = 0xFF099EE2;

  static const MaterialColor alizarinCrimsonAccent = MaterialColor(
    _alizarinCrimsonAccentValue,
    <int, Color>{
      100: Color(0xFFFFFDFD),
      200: Color(_alizarinCrimsonAccentValue),
      400: Color(0xFFFF979C),
      700: Color(0xFFFF7E84),
    },
  );

  static const int _alizarinCrimsonAccentValue = 0xFFFFCACD;

  static const MaterialColor alizarinCrimson = MaterialColor(
    _alizarinCrimsonPrimaryValue,
    <int, Color>{
      50: Color(0xFFFCE4E7),
      100: Color(0xFFF7BBC3),
      200: Color(0xFFF28E9C),
      300: Color(0xFFED6074),
      400: Color(0xFFE93E56),
      500: Color(_alizarinCrimsonPrimaryValue),
      600: Color(0xFFE21932),
      700: Color(0xFFDE142B),
      800: Color(0xFFDA1124),
      900: Color(0xFFD30917),
    },
  );
  static const int _alizarinCrimsonPrimaryValue = 0xFFE51C38;
}
