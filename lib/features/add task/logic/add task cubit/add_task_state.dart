part of 'add_task_cubit.dart';

abstract class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}
final class AddTaskLoading extends AddTaskState {}
final class AddTaskSuccess extends AddTaskState {}
final class AddTaskFailure extends AddTaskState {
  final String error;

  AddTaskFailure({required this.error});
}
