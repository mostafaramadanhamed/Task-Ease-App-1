part of 'fetch_task_cubit.dart';


abstract class FetchTaskState {}

final class FetchTaskInitial extends FetchTaskState {}
final class FetchTaskLoading extends FetchTaskState {}
final class FetchTaskSuccess extends FetchTaskState {}
final class DeleteTaskSuccess extends FetchTaskState {}
final class FetchTaskFailure extends FetchTaskState {
  final String error;

  FetchTaskFailure({required this.error});
}
