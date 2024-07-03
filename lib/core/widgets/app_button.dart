import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';
import '../styles/text_styles.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? backgroundColor;
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  const AppTextButton(
      {super.key,
        this.borderRadius,
        this.verticalPadding,
        this.horizontalPadding,
        this.buttonWidth,
        this.buttonHeight,
        this.backgroundColor,
        required this.buttonText,
        this.textStyle,
        required this.onPressed,
      });

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius?.r??14.0.r),
          boxShadow:  [
            BoxShadow(
              color: ColorsManager.kPrimaryColor.withOpacity(0.66),
              blurRadius: 30,
              offset: const Offset(0,7)
            )
          ]),
      child: TextButton(

        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius?.r??14.0.r),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(backgroundColor??ColorsManager.kPrimaryColor),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: horizontalPadding?.w??12.w,
                vertical: verticalPadding?.h??14.h,),
            ),
            fixedSize: MaterialStateProperty.all(
              Size(buttonWidth?.w??double.maxFinite, buttonHeight?.h?? 52.h,),
            )
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle??TextStyles.font19SemiBold,
        ),
      ),
    );
  }
}