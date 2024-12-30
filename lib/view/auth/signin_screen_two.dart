// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/view/auth/login_screen.dart';
import 'package:school_post/widgets/widget%20_title.dart';

class SigninScreenTwo extends StatefulWidget {
  const SigninScreenTwo({super.key});

  @override
  State<SigninScreenTwo> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SigninScreenTwo> {
  String _selectedOption =
      "Personnel"; // Par défaut, l'option sélectionnée est "Personnel"
  final TextEditingController matriculeController = TextEditingController();
  final TextEditingController promotionController = TextEditingController();

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Institution",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        fillColor: greyColor,
                        filled: true,
                        prefixIcon: const Icon(Icons.school),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Faculté ou filière",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        fillColor: greyColor,
                        filled: true,
                        prefixIcon: const Icon(Icons.settings),
                      ),
                      obscureText: true,
                    ),
                    // Dropdown pour sélectionner Étudiant ou Personnel
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: DropdownButtonFormField<String>(
                        borderRadius: BorderRadius.circular(12),
                        value: _selectedOption,
                        decoration: InputDecoration(
                          labelText: "Fonction",
                          labelStyle: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          fillColor: greyColor,
                          filled: true,
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "Étudiant",
                            child: Text("Étudiant"),
                          ),
                          DropdownMenuItem(
                            value: "Personnel",
                            child: Text("Personnel"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Champs supplémentaires pour Étudiant
                    if (_selectedOption == "Étudiant") ...[
                      TextField(
                        controller: matriculeController,
                        decoration: InputDecoration(
                            //labelText: "Matricule",
                            hintText: "Matricule",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: Icon(Icons.tag)),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: promotionController,
                        decoration: InputDecoration(
                            //labelText: "Promotion",
                            hintText: "Promotion",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                            prefixIcon: Icon(Icons.bookmark)),
                      ),
                    ],
                    const SizedBox(height: 20),
                    Container(
                        padding: const EdgeInsets.only(top: 0, left: 3),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: yellowColor,
                          ),
                          child: Text(
                            "S'enregistrer",
                            style: TextStyle(color: blackColor),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Avez-vous déjà un compte ?"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: Text(
                              "Se connecter",
                              style: TextStyle(color: yellowColor),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
