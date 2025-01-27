// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IconButtonWithPopup extends StatefulWidget {
  const IconButtonWithPopup({super.key});

  @override
  _IconButtonWithPopupState createState() => _IconButtonWithPopupState();
}

class _IconButtonWithPopupState extends State<IconButtonWithPopup> {
  bool _showButtons = false;

  void _toggleButtons() {
    setState(() {
      _showButtons = !_showButtons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_showButtons)
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle save action
                },
                child: Text('Save'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle edit action
                },
                child: Text('Edit'),
              ),
            ],
          ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: _toggleButtons,
        ),
      ],
    );
  }
}