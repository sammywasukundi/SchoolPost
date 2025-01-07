import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;

  const SearchButton({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      color: iconColor,
      onPressed: onPressed,
    );
  }
}
