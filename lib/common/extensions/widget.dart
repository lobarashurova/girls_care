import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IntX on int {
  Widget get kh => SizedBox(height: toDouble().h);

  Widget get kw => SizedBox(width: toDouble().w);
}
