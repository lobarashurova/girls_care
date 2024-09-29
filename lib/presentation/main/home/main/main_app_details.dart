    import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

List<String> navTitle = ["Asosiy", "Maqolalar", "Yordamchi", "Hisob"];

    List<Widget> navIconsSelected = [
      Assets.icons.asosiySelected.svg(width: 20.w, height: 20.h),
      Assets.icons.maqolalarSelect.svg(width: 20.w, height: 20.h),
      Assets.icons.yordamchiSelect.svg(width: 20.w, height: 20.w),
      Assets.icons.hisobSelect.svg(width: 20.w, height: 20.w),
    ];

    List<Widget> navIconsUnselected = [
      Assets.icons.asosiyUnselect.svg(width: 20.w, height: 20.w),
      Assets.icons.maqolalarUnselect.svg(width: 20.w, height: 20.w),
      Assets.icons.yordamchiUnselect.svg(width: 20.w, height: 20.w),
      Assets.icons.hisobUnselect.svg(width: 20.w, height: 20.w),
    ];