import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/constants/app_colors.dart';

abstract class AppStyles{

  static final TextStyle titleL = TextStyle(
    color: AppColors.body,
    fontSize: 22.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle titleM = TextStyle(
    color: AppColors.body,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyL = TextStyle(
    color: AppColors.body,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyM = TextStyle(
    color: AppColors.body,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
}