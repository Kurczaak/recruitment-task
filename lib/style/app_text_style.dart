import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static const fontFamilyAndroid = 'Roboto';
  static const fontFamilyIos = 'SF';

  static final header1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    height: 1.35,
  );

  static final header2 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.35,
  );

  static final bodySRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static final bodyMRegular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static final bodyMMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static final bodyMBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 1.5,
  );

  static final buttonS = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 1.0,
  );

  static final buttonM = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    height: 1.0,
  );
}
