// ignore_for_file: prefer_const_constructors

//import 'dart:io';

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/view/auth/signin_view_two.dart';
import 'package:school_post/widgets/widget_title.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class SigninScreenOne extends StatefulWidget {
  const SigninScreenOne({super.key});

  @override
  State<SigninScreenOne> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SigninScreenOne> {
  final _nameController = TextEditingController();
  final _postnomController = TextEditingController();
  final _mailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  //File? _selectedImage;
  bool isLoading = false;
  final ImagePicker _imagePicker = ImagePicker();
  bool _obscureText = true;
  String? imageUrl;

  // Fonction pour choisir une image depuis la galerie
  Future<void> pickImage() async {
    try {
      XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (res != null) {
        File imageFile = File(res.path);

        // Appel de processImage pour rogner l'image
        File? croppedImage = await processImage(imageFile);

        if (croppedImage != null) {
          await uploadImageToFirebase(croppedImage);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Échec lors du chargement de l\'image: $e'),
        ),
      );
    }
  }

  // Fonction pour uploader l'image sur Firebase Storage
  Future<void> uploadImageToFirebase(File image) async {
    setState(() {
      isLoading = true;
    });
    try {
      // Référence à l'emplacement où l'image sera stockée
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().microsecondsSinceEpoch}.png");

      // Téléchargement du fichier dans Firebase Storage
      await reference.putFile(image).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            content: Text('Image chargée avec succès'),
          ),
        );
      });

      // Récupération de l'URL de l'image
      imageUrl = await reference.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Échec lors du chargement de l\'image: $e'),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

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
                              backgroundColor: bgColor,
                              radius: 50,
                              child: imageUrl == null
                                  ? Icon(
                                      Icons.person_outline,
                                      size: 80,
                                      color: blueColor,
                                    )
                                  : SizedBox(
                                      height: 200,
                                      child: ClipOval(
                                          child: Image.network(
                                        imageUrl!,
                                        fit: BoxFit.cover,
                                      )))),
                        ),
                        if (isLoading)
                          Positioned(
                            top: 35,
                            right: 135,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        Positioned(
                          right: 100,
                          top: 10,
                          child: GestureDetector(
                            onTap: () {
                              pickImage();
                            },
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
                        controller: _nameController,
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
                        controller: _postnomController,
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
                        controller: _mailController,
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
                        controller: _pwdController,
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
                        controller: _confirmpwdController,
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

  Future<File?> processImage(File image) async {
    final editedImage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageCropper(
          image: image.readAsBytesSync(), // <-- Uint8List of image
        ),
      ),
    );

    if (editedImage != null && editedImage is List<int>) {
      await image.writeAsBytes(editedImage);
      return image;
    }
    return null;
  }
}
