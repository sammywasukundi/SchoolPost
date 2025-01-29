import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/view/auth/signin_view_one.dart';
import 'package:school_post/view/bottom_nav/home_view.dart';

// Déclaration des widgets
Widget header(BuildContext context) {
  return const Column(
    children: [
      Text(
        "Bienvenue sur SchoolPost",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 20,
      ),
      Text("Entrez vos identifiants pour vous connecter"),
    ],
  );
}


class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  bool _obscureText = true; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Adresse mail",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: greyColor,
            filled: true,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(top:8.0,left: 10.0),
              child: Text(
                '@',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.text,
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
                _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: blueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            "Se connecter",
            style: TextStyle(color: whiteColor),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: const Row(
            children: <Widget>[
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'OU',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              Expanded(child: Divider())
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: greyColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          icon: Brand(Brands.google),
          label: Text(
            "Continuer avec Google",
            style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}


Widget forgotPassword(BuildContext context) {
  return TextButton(
    onPressed: () {},
    child: Text(
      "Mot de passe oublié ?",
      style: TextStyle(color: blueColor),
    ),
  );
}


Widget signup(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Vous n'avez pas de compte ? "),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SigninScreenOne(),
            ),
          );
        },
        child: Text(
          "S'inscrire",
          style: TextStyle(color: blueColor),
        ),
      ),
    ],
  );
}
