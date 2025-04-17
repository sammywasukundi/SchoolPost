import 'package:flutter/material.dart';

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
        Image.asset(
          "assets/appIcon/icon.png",
          width: 90,
          height: 90
        ),
      ],
    );
  }
}

