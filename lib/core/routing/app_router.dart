import 'package:flutter/material.dart';
import 'package:task_ease/core/routing/routes.dart';
import 'package:task_ease/features/add%20task/data/models/task_model.dart';
import 'package:task_ease/features/add%20task/presentation/add_task_screen.dart';
import 'package:task_ease/features/edit%20task/presentation/edit_task_screen.dart';
import 'package:task_ease/features/onboarding/presesntation/onboarding_screen.dart';
import '../../features/home/presentation/home_screen.dart';

class AppRouter {

  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    switch (settings.name) {
      case Routes.initialScreen:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(),
        );
      case Routes.addTaskScreen:
        return MaterialPageRoute(
          builder: (_) =>
              const AddTaskScreen(),
        );
      case Routes.editTaskScreen:
        final task = settings.arguments as TaskModel;

        return MaterialPageRoute(

          builder: (_) => EditTaskScreen(task: task,),
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}