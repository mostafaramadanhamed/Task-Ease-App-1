import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_ease/core/routing/app_router.dart';
import 'package:task_ease/core/utils/shared_strings.dart';
import 'package:task_ease/task_ease_app.dart';

import 'bloc_observer.dart';
import 'core/notification/recieved_notification.dart';
import 'features/add task/data/models/task_model.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await NotificationHelper.initialize();
  await Hive.initFlutter();
  Bloc.observer=MyBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(SharedStrings.kTaskBox);
  runApp( TaskEaseApp(appRouter: AppRouter(),));
}
