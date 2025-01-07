import 'package:flutter/material.dart';
import 'package:flutter_load_kit/flutter_load_kit.dart';
import 'package:school_post/theme/app_colors.dart';

import 'auth/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration( seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 40.0,
          width: 40.0,
          child: LoadKitLineChase(
            color: yellowColor,
          ),
        ),
      ),
    );
  }
}