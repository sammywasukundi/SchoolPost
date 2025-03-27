// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

Widget buildButtonBudget(BuildContext context, IconData icon, String label,
    {VoidCallback? onTap}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shadowColor: blueColor,
      elevation: 5.0,
      padding: EdgeInsets.all(20),
      backgroundColor: blueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    onPressed: onTap ?? () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 32,
          color: whiteColor,
        ),
        SizedBox(height: 10),
        Text(label,
        textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: whiteColor,
            )),
      ],
    ),
  );
}
