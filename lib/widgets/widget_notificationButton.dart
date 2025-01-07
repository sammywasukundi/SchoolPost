// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
          icon: const Icon(Icons.notifications),
          color: iconColor,
          onPressed: onPressed,
        ),
        if (notificationCount > 0)
          Positioned(
            right: 4,
            top: -4,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Text(
                "$notificationCount",
                style: const TextStyle(
                  color: Colors.white,
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
