// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
<<<<<<< HEAD:lib/view/auth/signin_view_one.dart
import 'package:school_post/view/auth/signin_view_two.dart';
import 'package:school_post/widgets/widget%20_title.dart';
=======
import 'package:school_post/view/auth/signin_screen_two.dart';
import 'package:school_post/widgets/widget_title.dart';
>>>>>>> 05a6dfad186b0a13a57597f4469b8c3732402f74:lib/view/auth/signin_screen_one.dart

class SigninScreenOne extends StatefulWidget {
  const SigninScreenOne({super.key});

  @override
  State<SigninScreenOne> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SigninScreenOne> {
  bool _obscureText = true;
  String? imageUrl;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: true,
            elevation: 0.0,
            //backgroundColor: greyColor,
            shadowColor: bgColor,
            title: SchoolPostTitle(
                blueColor: blueColor, yellowColor: yellowColor)),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: greyColor,
                            backgroundImage: imageUrl != null
                                ? NetworkImage(imageUrl!)
                                : null,
                            child: imageUrl == null
                                ? Icon(Icons.person,
                                    size: 100, color: yellowColor)
                                : null,
                          ),
                        ),
                        if (isLoading)
                          Positioned(
                            top: 70,
                            right: 190,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        Positioned(
                          right: 90,
                          top: 12,
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.camera_alt,
                                color: yellowColor, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Nom",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: const Icon(Icons.person)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Postnom",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: const Icon(Icons.person)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Adresse mail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: const Icon(Icons.email)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: "Mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: greyColor,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: blackColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Confirmez le mot de passe",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          fillColor: greyColor,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: blackColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 0, left: 3),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SigninScreenTwo()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: yellowColor,
                        ),
                        child: Text(
                          "Suivant",
                          style: TextStyle(color: blackColor),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
