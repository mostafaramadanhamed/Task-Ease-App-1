import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/routing/app_router.dart';
import 'package:task_ease/features/home/logic/fetch%20task%20cubit/fetch_task_cubit.dart';

import 'core/routing/routes.dart';

class TaskEaseApp extends StatelessWidget {
  final AppRouter appRouter;

  const TaskEaseApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTaskCubit(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: "Lexend Deca"
          ),
          debugShowCheckedModeBanner: false,
          title: "Task Ease",
          initialRoute: Routes.initialScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
