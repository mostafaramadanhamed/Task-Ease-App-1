import 'package:flutter/material.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';
import 'package:task_ease/features/home/presentation/widget/task_item.dart';

class TaskListview extends StatelessWidget {
  const TaskListview({Key? key,required this.tasks, }) : super(key: key);
  final List<TaskModel>tasks;
  @override
  Widget build(BuildContext context) {

    if(tasks.isNotEmpty)    {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return 16.ph;
            },
            physics: const BouncingScrollPhysics(),
            itemCount: tasks.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return TaskItem(
                taskModel: tasks[index],
              );
            },
          );
        }
    else {
      return const Text("Not TASk");
    }

  }
}