

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class HelloRow extends StatelessWidget {
  const HelloRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 50.h,
            width: 50.h,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: ColorsManager.kPrimaryColor.withOpacity(0.15),
            ),
            child: Icon(Icons.person_outline_rounded,size: 30.sp,color: ColorsManager.kPrimaryColor,)),
        16.pw,
        Text("Hello",style: TextStyles.font18SemiBold,),
        const Spacer(),
        GestureDetector(child: Icon(Icons.notifications_active_outlined,color: ColorsManager.kPrimaryColor,size: 30.sp,)),
      ],
    );
  }
}