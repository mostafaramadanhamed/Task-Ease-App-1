import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject{
  @HiveField(0)
   int id;
  @HiveField(1)
   String taskGroup;
  @HiveField(2)
   String projectName;
  @HiveField(3)
   String description;
  @HiveField(4)
   DateTime selectedDate;
  @HiveField(5)
   String selectedTime;

  TaskModel(
      {required this.id,
      required this.taskGroup,
      required this.projectName,
      required this.description,
      required this.selectedDate,
      required this.selectedTime,
      });
}
