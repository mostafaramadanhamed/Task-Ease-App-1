import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/core/widgets/app_button.dart';
import 'package:task_ease/core/widgets/app_text_field.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';
import 'package:task_ease/features/home/logic/fetch%20task%20cubit/fetch_task_cubit.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';


class EditTaskForm extends StatefulWidget {
  final TaskModel task;
  const EditTaskForm({super.key, required this.task});

  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey =GlobalKey();
  TextEditingController taskGroupController=TextEditingController();
  TextEditingController projectNameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  DateTime? initialDate;// Default to current date
  TimeOfDay ?initialTime;// Default to current time
  bool isTape=false;
  String ? taskGroup,projectName,disc;
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
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          24.ph,
          AppTextFormField(hintText: widget.task.taskGroup ,controller: taskGroupController,onChanged: (val){
            taskGroup=val;
          },),
          24.ph,
          AppTextFormField( controller: projectNameController,hintText: widget.task.projectName,
            onChanged: (val){
              projectName=val;
            },
          ),
          24.ph,
          AppTextFormField(hintText: "Description",maxLine: 6,textInputType: TextInputType.multiline, controller: descriptionController,
            onChanged: (val){
              disc=val;
            },
          ),
          24.ph,
          ListTile(
            onTap: () async {
              initialDate = await selectDate(context, (date) {
                setState(() {
                  initialDate = date;

                });
              });
            },
            tileColor: Colors.white,
            splashColor: ColorsManager.kPrimaryLightColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            leading: const Icon(Icons.calendar_month_sharp, color: ColorsManager.kPrimaryColor),
            title: Text(
             DateFormat.yMMMEd().format(initialDate??widget.task.selectedDate),
              style: TextStyles.font18SemiBold,
            ),
          ),
          24.ph,
          ListTile(
            onTap: () async {
              initialTime = await selectTime(context, (time) {
                setState(() {
                  isTape=true;
                  initialTime = time;
                });
              });
            },
            tileColor: Colors.white,
            splashColor: ColorsManager.kPrimaryLightColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
            leading: const Icon(Icons.watch_later, color: ColorsManager.kPrimaryColor),
            title: Text(
             isTape?initialTime!.format(context): widget.task.selectedTime,
              style: TextStyles.font18SemiBold,
            ),
          ),
          65.ph,
          AppTextButton(buttonText: "Edit Project", onPressed:() {

                  //todo edit tasks data
                  widget.task.taskGroup=taskGroup ?? widget.task.taskGroup;
                  widget.task.projectName=projectName ?? widget.task.projectName;
                  widget.task.description=disc ?? widget.task.description;
                  widget.task.selectedDate=initialDate ?? widget.task.selectedDate;
                  isTape?widget.task.selectedTime=initialTime!.format(context):widget.task.selectedTime=widget.task.selectedTime;
                  widget.task.save();
                  BlocProvider.of<FetchTaskCubit>(context).fetchAllTasks();
                  context.pop();

            },
          ),
          24.ph,
        ],
      ),
    );
  }
}
