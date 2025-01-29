// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/view/auth/signin_view_two.dart';
import 'package:school_post/widgets/widget_title.dart';

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
                                ? Icon(Icons.person_2_outlined,
                                    size: 100, color: blueColor)
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
                            child: Icon(Icons.camera_alt_outlined,
                                color: blueColor, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Nom",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: const Icon(Icons.person_outlined)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Postnom",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: const Icon(Icons.person_outlined)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Adresse mail",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          fillColor: greyColor,
                          filled: true,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(top: 8.0, left: 10.0),
                            child: Text(
                              '@',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: "Mot de passe",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: greyColor,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_outlined),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
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
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Confirmez le mot de passe",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          fillColor: greyColor,
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
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
                          backgroundColor: blueColor,
                        ),
                        child: Text(
                          "Suivant",
                          style: TextStyle(color: whiteColor),
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
