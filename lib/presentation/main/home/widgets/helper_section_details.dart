import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:girls_care/common/gen/assets.gen.dart';

Map<String, Image> helperSectionCircle = {
  "Alomatlar": Assets.icons.alomatlarIcon.image(width: 78.w, height: 78.h),
  "Kayfiyat": Assets.icons.kayfiyatIcon.image(width: 78.w, height: 78.h),
  "Dorilar": Assets.icons.dorilarIcon.image(width: 78.w, height: 78.h),
  "Kundalik": Assets.icons.kundalikIcon.image(width: 78.w, height: 78.h),
};

Map<String, Image> aloqaCircle = {
  "Mavjud emas": Assets.icons.unavailable.image(width: 50.w, height: 50.h),
  "Himoyalangan": Assets.icons.protected.image(width: 50.w, height: 50.h),
  "Orgazm": Assets.icons.organizm.image(width: 50.w, height: 50.h),
  "Himoyalanmagan": Assets.icons.unprotected.image(width: 50.w, height: 50.h),
};

Map<String, Image> symtomsSmall = {
  "Bosh og’rig’i": Assets.icons.headache.image(width: 24.w, height: 24.h),
  "Bosh aylanishi": Assets.icons.boshAylanishi.image(width: 24.w, height: 24.h),
  "Akne": Assets.icons.akne.image(width: 24.w, height: 24.h),
  "Isitma": Assets.icons.isitma.image(width: 24.w, height: 24.h),
};
Map<String, Image> moodSmall = {
  "Asabiylik": Assets.icons.asabiylik.image(width: 24.w, height: 24.h),
  "Tushkunlik": Assets.icons.tushkunlik.image(width: 24.w, height: 24.h),
  "Tashvish hissi": Assets.icons.taslim.image(width: 24.w, height: 24.h),
  "Kayfiyatsizlik":
      Assets.icons.kayfiyatsizlik.image(width: 24.w, height: 24.h),
};
