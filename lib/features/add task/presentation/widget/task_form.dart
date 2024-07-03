import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/core/widgets/app_button.dart';
import 'package:task_ease/core/widgets/app_text_field.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';
import 'package:task_ease/features/add%20task/logic/add%20task%20cubit/add_task_cubit.dart';
import 'package:task_ease/features/home/logic/fetch%20task%20cubit/fetch_task_cubit.dart';

import '../../../../core/notification/recieved_notification.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
import '../../../../core/utils/snack_bar.dart';


class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey =GlobalKey();
  TextEditingController taskGroupController=TextEditingController();
  TextEditingController projectNameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  DateTime? initialDate;// Default to current date
  TimeOfDay ?initialTime;// Default to current date
bool isTaped=false;
  Future<DateTime?> selectDate(BuildContext context, Function(DateTime) onDateSelected) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      onDateSelected(picked);  // Call the callback with selected date
    }
    return picked;
  }
  Future<TimeOfDay?> selectTime(BuildContext context, Function(TimeOfDay) onTimeSelected) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context, initialTime: TimeOfDay.now(),

    );
    if (picked != null) {
      onTimeSelected(picked);  // Call the callback with selected date
    }
    return picked;
  }

  @override
  void initState() {
    super.initState();
    initialDate = DateTime.now();
    initialTime=TimeOfDay.now();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          24.ph,
          AppTextFormField(hintText: "Task Group",controller: taskGroupController,),
          24.ph,
          AppTextFormField(hintText: "Project Name", controller: projectNameController,),
          24.ph,
          AppTextFormField(hintText: "Description",maxLine: 6,textInputType: TextInputType.multiline, controller: descriptionController,),
          24.ph,
          ListTile(
            onTap: () async {
              initialDate = await selectDate(context, (date) {
                setState(() {
                  isTaped=true;
                  initialDate = date;

                });
              });
            },
            tileColor: Colors.white,
            splashColor: ColorsManager.kPrimaryLightColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            leading: const Icon(Icons.calendar_month_sharp, color: ColorsManager.kPrimaryColor),
            title: Text(
            isTaped? DateFormat.yMMMEd().format(initialDate!):"Enter Date",
              style: TextStyles.font18SemiBold,
            ),
          ),
          24.ph,
          ListTile(
            onTap: () async {
              initialTime = await selectTime(context, (time) {
                setState(() {
                  initialTime = time;
                });
              });
            },
            tileColor: Colors.white,
            splashColor: ColorsManager.kPrimaryLightColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            leading: const Icon(Icons.watch_later, color: ColorsManager.kPrimaryColor),
            title: Text(
              initialTime!.format(context),
              style: TextStyles.font18SemiBold,
            ),
          ),
          65.ph,
          BlocBuilder<AddTaskCubit, AddTaskState>(
            builder: (context, state) {
              return AppTextButton(buttonText: "Add Project", onPressed:()async {
                if(formKey.currentState!.validate()&& isTaped){
                  formKey.currentState!.save();

                  var taskModel=TaskModel(id:  hashCode,
                      taskGroup: taskGroupController.text,
                      projectName: projectNameController.text,
                      description: descriptionController.text,
                      selectedDate: initialDate!,
                      selectedTime: initialTime!.format(context));
                  BlocProvider.of<AddTaskCubit>(context).addTask(taskModel);
                  BlocProvider.of<FetchTaskCubit>(context).fetchAllTasks();
                  ScaffoldMessenger.of(context).showSnackBar( buildSnackBar(text: 'Task was added successfully',color: Colors.white),);
                  context.pop();
                  if(!mounted) return;
   await NotificationHelper.showScheduledNotification(hashCode, taskGroupController.text, projectNameController.text, DateTime(initialDate!.year,initialDate!.month,initialDate!.day,initialTime!.hour,initialTime!.minute));

                }
                else{
                  autoValidateMode=AutovalidateMode.always;
                  setState((){});
                }
              });
            },
          ),
          24.ph,
        ],
      ),
    );
  }
}
