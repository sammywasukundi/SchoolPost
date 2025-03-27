import 'package:flutter/material.dart';
import 'package:school_post/widgets/post_widget.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              PostWidget(),
            ],
          ),
        ),
    );
  }
}