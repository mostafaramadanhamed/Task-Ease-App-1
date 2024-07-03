import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/features/home/presentation/widget/date_time_horizontal.dart';
import 'package:task_ease/features/home/presentation/widget/tasks_list_view.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../add task/data/models/task_model.dart';
import '../logic/fetch task cubit/fetch_task_cubit.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    BlocProvider.of<FetchTaskCubit>(context, listen: false).fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTaskCubit, FetchTaskState>(

      builder: (context, state) {
        if (state is FetchTaskLoading) {
          return const CircularProgressIndicator();
        }
        else if (state is FetchTaskFailure) {
          return Text(state.error);
        }
        else if (state is FetchTaskSuccess) {
          List<TaskModel>tasks = BlocProvider
              .of<FetchTaskCubit>(context)
              .tasks!
              .where((element) => element.selectedDate == dateTime)
              .toList();

          return Scaffold(
            floatingActionButton:FloatingActionButton(
              onPressed: () {
                context.pushNamed(Routes.addTaskScreen);
                debugPrint(" gh :${DateTime.now()}");
              },
              backgroundColor: ColorsManager.kPrimaryColor.withOpacity(0.3),
              elevation: 0,
              child: const Icon(
                Icons.add_outlined, color: ColorsManager.kPrimaryColor,),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Column(
                  children: [
                    16.ph,
                    DatePickerHorizontal(
                      dateTime: dateTime!, onDateChange: (date) {
                      setState(() {
                        dateTime = date;
                      });
                    },),
                    32.ph,
                    Expanded(child: TaskListview(tasks: tasks,)),
                  ],
                ),
              ),
            ),
          );
        }
        else {
          return const Text("UN ");
        }
      },
    );
  }
}


