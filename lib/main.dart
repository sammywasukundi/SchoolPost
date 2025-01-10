import 'package:flutter/material.dart';
import 'package:school_post/view/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SchoolPost',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
// https://youtu.be/T6B6sj6ZfqU configuration //
//https://youtu.be/qyP1NOXT9GU crud firebase// https://youtu.be/qyP1NOXT9GU?list=TLPQMDEwMTIwMjVWlxzR5uErGQ

