import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

import '../../widgets/widgets_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            header(context),      
            const SizedBox(height: 20),
            inputField(context),
              
            //const SizedBox(height: 10),
            //forgotPassword(context), 
            const SizedBox(height: 10),
            signup(context),       
          ],
        ),
      ),
    );
  }
}