import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_title.dart';
import 'package:school_post/widgets/widgets_auth.dart';

import '../../theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SchoolPostTitle(blueColor: blueColor, yellowColor: yellowColor),
            const SizedBox(height: 50),
            const InputField(), // Appel du widget Stateful
            const SizedBox(height: 10),
            forgotPassword(context),
            const SizedBox(height: 10),
            signup(context),
          ],
        ),
      ),
    );
  }
}
