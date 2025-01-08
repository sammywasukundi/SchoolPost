import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SchoolPostTitle extends StatelessWidget {
  final Color blueColor;
  final Color yellowColor;

  const SchoolPostTitle({
    super.key,
    required this.blueColor,
    required this.yellowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Brand(Brands.homeadvisor),
        const SizedBox(width: 5),
        Text(
          "School",
          style: TextStyle(
            color: blueColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        Text(
          "Post",
          style: TextStyle(
            color: yellowColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

