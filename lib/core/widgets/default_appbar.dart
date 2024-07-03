import 'package:flutter/material.dart';
import 'package:task_ease/core/routing/routing_extension.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';


AppBar buildDefaultAppBar(String title,BuildContext context,{
  String ? path,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(title, style: TextStyles.font18SemiBold,),
    centerTitle: true,
    leading: IconButton(
      onPressed: (){
     context.pop();
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined,),
    ),
    iconTheme: const IconThemeData(
      color: ColorsManager.kPrimaryColor,
    ),
  );
}