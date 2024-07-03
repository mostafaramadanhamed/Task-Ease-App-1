
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_ease/core/utils/shared_strings.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

addTask (TaskModel task)async{
    emit(AddTaskLoading());
    try{
      var taskBox=Hive.box<TaskModel>(SharedStrings.kTaskBox);
      taskBox.add(task);
      emit(AddTaskSuccess());
    }
    catch(ex){
      emit(AddTaskFailure(error: ex.toString()));
    }
}
}
