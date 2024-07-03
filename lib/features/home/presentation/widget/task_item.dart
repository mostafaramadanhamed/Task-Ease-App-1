import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ease/core/routing/routes.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import 'package:task_ease/core/utils/snack_bar.dart';
import 'package:task_ease/core/utils/spacing_extension.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';
import 'package:task_ease/features/home/logic/fetch%20task%20cubit/fetch_task_cubit.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';
class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key, required this.taskModel,
  });
final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.pushNamed(Routes.editTaskScreen,arguments: taskModel);
      },
      child: Dismissible(
        key: Key(taskModel.id.toString()),

      onDismissed: (dis){
      taskModel.delete();
      ScaffoldMessenger.of(context).showSnackBar( buildSnackBar(text: "Deleted Successfully", color: Colors.white));
      BlocProvider.of<FetchTaskCubit>(context).fetchAllTasks();
        },
        child: Card(
          elevation: 18,
          shadowColor: Colors.grey.shade50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r)
          ),
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 20.w,vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(taskModel.taskGroup,style: TextStyles.font15Medium,),
                    const Spacer(),
                    Dismissible(
                      onDismissed: (dis){
                        taskModel.delete();
                        ScaffoldMessenger.of(context).showSnackBar( buildSnackBar(text: "Deleted Successfully", color: Colors.white));
                        BlocProvider.of<FetchTaskCubit>(context).fetchAllTasks();
                      },
                      key: Key(taskModel.id.toString()),
                      child: Container(
                          height: 36.h,
                          width: 36.h,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: ColorsManager.kPrimaryColor.withOpacity(0.15),
                          ),
                          child: Icon(Icons.delete,size: 24.sp,color: ColorsManager.kPrimaryColor,)),
                    ),
                  ],
                ),
                12.ph,
                Text(taskModel.projectName,style: TextStyles.font18SemiBold,),
                12.ph,
              Text(taskModel.description,style: TextStyles.font15Medium,),
                12.ph,
                Row(
                  children: [
                    Icon(Icons.access_time_filled_rounded,size: 20.sp,color: ColorsManager.kPrimaryLightColor,),
                    8.pw,
                    Text(taskModel.selectedTime,style: TextStyles.font11Medium,)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
