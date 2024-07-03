import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/widgets/default_appbar.dart';
import 'package:task_ease/features/add%20task/logic/add%20task%20cubit/add_task_cubit.dart';
import 'package:task_ease/features/add%20task/presentation/widget/task_form.dart';

class AddTaskScreen extends StatelessWidget {

   const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AddTaskCubit(),
  child: Scaffold(
      appBar: buildDefaultAppBar("Add Project", context),
      body:  Padding(
        padding:EdgeInsets.symmetric(horizontal: 22.0.w),
        child: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: TaskForm(),
        ),
      ),
    ),
);
  }
}
