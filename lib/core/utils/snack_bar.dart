import 'package:flutter/material.dart';
import 'package:task_ease/core/styles/colors.dart';

SnackBar buildSnackBar({required String text,required Color color}) {
  return SnackBar(
    content:  Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: ColorsManager.kPrimaryLightColor, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 2.0,
            blurRadius: 8.0,
            offset: Offset(2, 4),
          )
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(text,
        style:  const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: ColorsManager.kPrimaryColor,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    padding:  EdgeInsets.zero,
  );
}