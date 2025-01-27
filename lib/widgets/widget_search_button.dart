import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_forms.dart';

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
      icon: const Icon(Icons.search_outlined),
      color: iconColor,
      onPressed: () {
        FormHoraire().showSearchDialog(context, searchController);
      },
    );
  }
}

