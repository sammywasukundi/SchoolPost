import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final Color iconColor;
  final TextEditingController searchController;

  const SearchButton({
    super.key,
    required this.iconColor,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.search),
      color: iconColor,
      onPressed: () {
        //print('object');
      },
    );
  }
}

