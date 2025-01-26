// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

Widget buildButtonBudget(BuildContext context, IconData icon, String label,
    {VoidCallback? onTap}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shadowColor: blackColor,
      elevation: 2.0,
      padding: EdgeInsets.all(20),
      backgroundColor: whiteColor,
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
          size: 40,
          color: blueColor,
        ),
        SizedBox(height: 10),
        Text(label,
            style: TextStyle(
              fontSize: 16,
              color: blueColor,
            )),
      ],
    ),
  );
}
