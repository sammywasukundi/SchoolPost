import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/view/auth/signin_screen.dart';

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

Widget inputField(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      TextField(
        decoration: InputDecoration(
          hintText: "Nom d'utilisateur",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: greyColor,
          filled: true,
          prefixIcon: const Icon(Icons.person),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        decoration: InputDecoration(
          hintText: "Mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          fillColor: greyColor,
          filled: true,
          prefixIcon: const Icon(Icons.lock),
        ),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          //shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: yellowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          "Se connecter",
          style: TextStyle(color: blackColor),
        ),
      ),
      const SizedBox(height: 25,),
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
          //elevation: 3,
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

Widget forgotPassword(BuildContext context) {
  return TextButton(
    onPressed: () {},
    child: Text(
      "Mot de passe oublié ?",
      style: TextStyle(color: yellowColor),
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
              builder: (context) => const SignInScreen(),
            ),
          );
        },
        child: Text(
          "S'inscrire",
          style: TextStyle(color: yellowColor),
        ),
      ),
    ],
  );
}