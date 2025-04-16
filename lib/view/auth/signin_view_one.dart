import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_title.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import '../../services/auth_service.dart';
import '../../theme/app_dialog.dart';
import 'login_view.dart';

class SigninScreenOne extends StatefulWidget {
  const SigninScreenOne({super.key});

  @override
  State<SigninScreenOne> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SigninScreenOne> {
  final AuthService _authService = AuthService();
  final _nameController = TextEditingController();
  final _postnomController = TextEditingController();
  final _mailController = TextEditingController();
  final _pwdController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  String _selectedOption = "Enseignant";
  String? _selectedDomaine;
  String? _selectedPromotion;
  String? _selectedAnneeAcademique;
  bool _isLoadingButton = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController matriculeController = TextEditingController();
  final TextEditingController promotionController = TextEditingController();

  bool isLoading = false;
  final ImagePicker _imagePicker = ImagePicker();
  bool _obscureText = true;
  bool _obscureTextOne = true;
  String? imageUrl;

  void _signup() async {
    setState(() {
      _isLoadingButton = true; // Show loading spinner
    });

    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      setState(() {
        _isLoadingButton = false; // Hide loading spinner
      });
      return;
    }

    // Validation des champs
    if (_nameController.text.isEmpty ||
        _postnomController.text.isEmpty ||
        _mailController.text.isEmpty ||
        _pwdController.text.isEmpty ||
        _confirmpwdController.text.isEmpty) {
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

    if (_pwdController.text != _confirmpwdController.text) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Les mots de passe ne correspondent pas')),
        );
      });
      setState(() {
        _isLoadingButton = false; // Hide loading spinner
      });
      return;
    }

    try {
      // Call signup method from AuthService with user inputs
      String? result = await _authService.signup(
        name: _nameController.text,
        email: _mailController.text,
        password: _pwdController.text,
        role: _selectedOption,
        //institution: _selectedInstitution ?? '',
        field: _selectedDomaine,
        promotion: _selectedPromotion ?? '',
        matricule: matriculeController.text,
        imageUrl: imageUrl,
        postname: _postnomController.text,
        anneeAcademique: _selectedAnneeAcademique ?? '',
      );

      setState(() {
        _isLoadingButton = false; // Hide loading spinner
      });

      if (result == null) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          showSuccess(context, 'Succès', 'Enregistrement réussi');
        });
        await Future.delayed(Duration(seconds: 4));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      } else {
        showError(context, 'Erreur', 'l\'addresse mail est déjà utilisée');
      }
    } catch (e) {
      setState(() {
        _isLoadingButton = false; // Hide loading spinner
      });
      showError(context, 'Erreur', 'Une erreur est survenue: $e');
    }
  }

  // Fonction pour choisir une image depuis la galerie
  Future<void> pickImage() async {
    try {
      XFile? res = await _imagePicker.pickImage(source: ImageSource.gallery);
      if (res != null) {
        File imageFile = File(res.path);

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
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().microsecondsSinceEpoch}.png");

      await reference.putFile(image).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
            content: Text('Image chargée avec succès'),
          ),
        );
      });

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
              child: Form(
                key: _formKey,
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
                    Expanded(
                      child: ListView(children: <Widget>[
                        TextFormField(
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
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                            minLength: 3,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                            minLength: 3,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                            isEmail: true,
                            minLength: 6,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                            minLength: 6,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
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
                                _obscureTextOne
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: blackColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureTextOne = !_obscureTextOne;
                                });
                              },
                            ),
                          ),
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                            match: _pwdController.text,
                          ),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('anneeAcadems')
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: blueColor,
                                    strokeWidth: 2.0,
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return const Text(
                                  'Erreur de chargement des années académiques');
                            } else if (!snapshot.hasData ||
                                snapshot.data!.docs.isEmpty) {
                              return const Text(
                                  'Aucune année académique trouvée');
                            } else {
                              List<DropdownMenuItem<String>> items =
                                  snapshot.data!.docs.map((doc) {
                                return DropdownMenuItem<String>(
                                  value: doc.id,
                                  child: Text(doc['Libelle'] ?? 'sans nom'),
                                );
                              }).toList();

                              return DropdownButtonFormField<String>(
                                value: _selectedAnneeAcademique,
                                decoration: InputDecoration(
                                  labelText: 'Année académique',
                                  hintText: 'Sélectionnez une année académique',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: greyColor,
                                  filled: true,
                                ),
                                validator: (val) => uValidator(
                                  value: val,
                                  isRequired: true,
                                ),
                                items: items,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedAnneeAcademique = newValue;
                                    _selectedDomaine = null; // Reset faculty
                                    _selectedPromotion =
                                        null; // Reset promotion
                                  });
                                },
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          borderRadius: BorderRadius.circular(12),
                          value: _selectedOption,
                          decoration: InputDecoration(
                            hintText: 'Role',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            fillColor: greyColor,
                            filled: true,
                          ),
                          items: ['Etudiant', 'Enseignant'].map((role) {
                            return DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        // Champs supplémentaires pour Étudiant
                        if (_selectedOption == "Etudiant") ...[
                          FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('promotions')
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: blueColor,
                                    strokeWidth: 2.0,
                                  ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return const Text(
                                    'Erreur de chargement des promotions');
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.docs.isEmpty) {
                                return const Text('Aucune promotion trouvée');
                              } else {
                                List<DropdownMenuItem<String>> items =
                                    snapshot.data!.docs.map((doc) {
                                  return DropdownMenuItem<String>(
                                    value: doc.id,
                                    child: Text(doc['Libelle'] ?? 'sans nom'),
                                  );
                                }).toList();

                                return DropdownButtonFormField<String>(
                                  value: _selectedPromotion,
                                  decoration: InputDecoration(
                                    labelText: 'Promotion',
                                    hintText: 'Sélectionnez une promotion',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                    fillColor: greyColor,
                                    filled: true,
                                  ),
                                  validator: (val) => uValidator(
                                    value: val,
                                    isRequired: true,
                                  ),
                                  items: items,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedPromotion = newValue;
                                    });
                                  },
                                );
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            controller: matriculeController,
                            decoration: InputDecoration(
                              hintText: "Matricule",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: greyColor,
                              filled: true,
                            ),
                            validator: (val) => uValidator(
                              value: val,
                              isRequired: true,
                              lengthMatri: 4,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                        // Champs supplémentaires pour Enseignant
                        if (_selectedOption == "Enseignant") ...[
                          FutureBuilder<QuerySnapshot>(
                              future: FirebaseFirestore.instance
                                  .collection('domaines')
                                  .get(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: blueColor,
                                        strokeWidth: 2.0,
                                      ),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const Text(
                                      'Erreur de chargement des domaines');
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.docs.isEmpty) {
                                  return const Text('Aucune domaine trouvée');
                                } else {
                                  List<DropdownMenuItem<String>> items =
                                      snapshot.data!.docs.map((doc) {
                                    return DropdownMenuItem<String>(
                                      value: doc.id,
                                      child:
                                          Text(doc['nomDomne'] ?? 'sans nom'),
                                    );
                                  }).toList();

                                  return DropdownButtonFormField<String>(
                                    value: _selectedDomaine,
                                    decoration: InputDecoration(
                                      labelText: 'Domaine',
                                      hintText: 'Sélectionnez une domaine',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor: greyColor,
                                      filled: true,
                                    ),
                                    validator: (val) => uValidator(
                                      value: val,
                                      isRequired: true,
                                    ),
                                    items: items,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _selectedDomaine = newValue;
                                      });
                                    },
                                  );
                                }
                              }),
                          const SizedBox(
                            height: 8.0,
                          ),
                        ]
                      ]),
                    ),
                    _isLoadingButton
                        ? Center(
                            child: CircularProgressIndicator(
                              color: blueColor,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 0, left: 3),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState == null ||
                                    !_formKey.currentState!.validate()) {
                                  return;
                                }
                                _signup();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                backgroundColor: blueColor,
                              ),
                              child: Text(
                                "S'enregistrer",
                                style: TextStyle(color: whiteColor),
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
                              style: TextStyle(color: blueColor),
                            ))
                      ],
                    ),
                  ],
                ),
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
