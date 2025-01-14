import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;

  const ProfileButton({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle),
      color: iconColor,
      onPressed: onPressed,
    );
  }
}
