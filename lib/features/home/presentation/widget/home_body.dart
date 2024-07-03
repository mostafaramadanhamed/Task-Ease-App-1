/*

 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/features/home/logic/fetch%20task%20cubit/fetch_task_cubit.dart';
import 'package:task_ease/features/home/presentation/widget/tasks_list_view.dart';

import 'date_time_horizontal.dart';


class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
   DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchTaskCubit>(context,).fetchAllTasks();
  }
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              16.ph,
              DatePickerHorizontal(
                dateTime: dateTime??DateTime.now(), onDateChange: (date) {
                setState(() {
                  dateTime = date;
                });
              },),
              32.ph,
              Expanded(child: TaskListview(dateTime: dateTime??DateTime.now(),)),
            ],
          ),
        ),
      );
  }
}