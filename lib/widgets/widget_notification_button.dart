// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class NotificationsButton extends StatelessWidget {
  final Color iconColor;
  final int notificationCount;
  final VoidCallback onPressed;

  const NotificationsButton({
    super.key,
    required this.iconColor,
    required this.notificationCount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          color: iconColor,
          onPressed: onPressed,
        ),
        if (notificationCount > 0)
          Positioned(
            right: 6,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                "$notificationCount",
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
