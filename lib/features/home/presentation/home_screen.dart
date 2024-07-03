import 'package:flutter/material.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import 'package:task_ease/features/home/presentation/widget/home_body.dart';
import '../../../../core/styles/colors.dart';
import '../../../core/routing/routes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            floatingActionButton:FloatingActionButton(
              onPressed: () {
                context.pushNamed(Routes.addTaskScreen);
              },
              backgroundColor: ColorsManager.kPrimaryColor.withOpacity(0.3),
              elevation: 0,
              child: const Icon(
                Icons.add_outlined, color: ColorsManager.kPrimaryColor,),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
            body: const HomeBody(),
    );
  }
}


