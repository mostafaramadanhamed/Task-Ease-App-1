import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/routing/routes.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import 'package:task_ease/core/styles/text_styles.dart';
import 'package:task_ease/core/utils/assets.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/core/widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          SafeArea(minimum: EdgeInsets.only(top: 46.h),child: Image.asset(Assets.onboardingImage,height:482.h ,width: 408.w,fit: BoxFit.cover,),),
          Text("Task Management &\n To-Do List",style: TextStyles.font24SemiBold,textAlign: TextAlign.center,),
          20.ph,
          Text("This productive tool is designed to help \n you better manage your task \n project-wise conveniently!",
            style: TextStyles.font14Regular,textAlign: TextAlign.center,),
          40.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0.w),
            child: AppTextButton(buttonText: "Let's Start", onPressed: (){
              context.pushReplacementNamed(Routes.homeScreen);
            }),
          ),
        ],
      ),
    );
  }
}
