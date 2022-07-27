import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BoxShadow baseLightShadow() => BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: Offset(0, 2.w),
      blurRadius: 5.r,
    );

BoxShadow lightShadow() => BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: Offset(0, 1.w),
      blurRadius: 2.r,
    );

BoxShadow baseBlurredShadow() => BoxShadow(
      color: Colors.black.withOpacity(0.1),
      offset: Offset(0, 0.w),
      blurRadius: 10.r,
    );
