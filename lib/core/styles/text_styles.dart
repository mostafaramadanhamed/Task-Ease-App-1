
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'font_helper.dart';

abstract class TextStyles{
  static TextStyle font24SemiBold=TextStyle(
    color: ColorsManager.kMainColor,
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font19SemiBold=TextStyle(
    color: Colors.white,
    fontSize: 19.sp,
    fontWeight: FontWeightHelper.semiBold,
  ); static TextStyle font18SemiBold=TextStyle(
    color: ColorsManager.kMainColor,
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.semiBold,
  );
static TextStyle font15Medium=TextStyle(
    color: ColorsManager.kSecondaryColor,
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
  );
static TextStyle font14Regular=TextStyle(
    color: ColorsManager.kSecondaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
  );
static TextStyle font13Regular=TextStyle(
    color: ColorsManager.kMainColor,
    fontSize: 13.sp,
    fontWeight: FontWeightHelper.regular,
  );

static TextStyle font11Medium=TextStyle(
    color: ColorsManager.kPrimaryLightColor,
    fontSize: 11.sp,
    fontWeight: FontWeightHelper.medium,
  );

static TextStyle font9Regular=TextStyle(
    color: ColorsManager.kSecondaryColor,
    fontSize: 9.sp,
    fontWeight: FontWeightHelper.regular,
  );


}