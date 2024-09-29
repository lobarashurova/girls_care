import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.of(this).pushReplacement<T, TO>(MaterialPageRoute(builder: (_) => page));
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }
}