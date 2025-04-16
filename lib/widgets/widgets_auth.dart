import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/view/auth/signin_view_one.dart';
import 'package:school_post/view/bottom_nav/home_view.dart';

import '../services/auth_service.dart';

class InputField extends StatefulWidget {
  const InputField({super.key});

  @override
  InputFieldState createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoadingButton = false;
  bool _rememberMe = false;

  void _login() async {
    setState(() {
      _isLoadingButton = true; // Show spinner
    });

    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      setState(() {
        _isLoadingButton = false; // Hide loading spinner
      });
      return;
    }

    // Validation des champs
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veuillez remplir tous les champs')),
        );
      });
      setState(() {
        _isLoadingButton = false; // Hide loading spinner
      });
      return;
    }

    String? result = await _authService.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    setState(() {
      _isLoadingButton = false; // Hide spinner
    });

    // Navigate based on role or show error message
    if (result == 'Enseignant') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );
    } else if (result == 'Etudiant') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const UserScreen(),
        ),
      );
    } else if (_emailController.text == 'administrateur@gmail.com' &&
        _passwordController.text == 'administrateur') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AdminScreen(),
        ),
      );
    } else {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text('Login Failed: $result'), // Show error message
      // ));
      SchedulerBinding.instance.addPostFrameCallback((_) {
        showError(context, 'Erreur', 'Mauvais identifiants ou mot de passe');
      });
    }
  }

  bool _obscureText = true;
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
                controller: _emailController,
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
                    padding: EdgeInsets.only(top: 8.0, left: 10.0),
                    child: Text(
                      '@',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
                validator: (val) =>
                    uValidator(value: val, isRequired: true, isEmail: true)),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
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
              validator: (val) =>
                uValidator(value: val, isRequired: true, minLength: 6),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value ?? false;
                });
                },
              ),
              const Text("Se souvenir de moi"),
              ],
            ),
            const SizedBox(height: 10),
            _isLoadingButton
              ? Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: blueColor,
                  )))
              : ElevatedButton(
                onPressed: _login,
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
              onPressed: () {
                showError(context, 'Oh damn !!', 'Service indisponible');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: greyColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
              icon: Brand(Brands.google),
              label: Text(
                "Continuer avec Google",
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
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
