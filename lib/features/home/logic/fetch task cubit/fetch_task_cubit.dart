
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:task_ease/core/utils/shared_strings.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';

part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit() : super(FetchTaskInitial());

  List<TaskModel>?tasks=[];
  var taskBox=Hive.box<TaskModel>(SharedStrings.kTaskBox);

 fetchAllTasks() {
   emit(FetchTaskLoading());
   try{
      tasks = taskBox.values.toList();
      emit(FetchTaskSuccess());
    }
    catch(ex){
     emit(FetchTaskFailure(error: ex.toString()));
    }
  }

}
