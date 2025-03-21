// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/models/other_classes/institution_data.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/view/auth/login_view.dart';
import 'package:school_post/widgets/widget_title.dart';

import '../../theme/app_requirements.dart';

class SigninScreenTwo extends StatefulWidget {
  const SigninScreenTwo({super.key});

  @override
  State<SigninScreenTwo> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SigninScreenTwo> {
  //final AuthService _authService = AuthService();
  String _selectedOption = "Personnel"; // Par défaut : Personnel
  String? _selectedInstitution;
  String? _selectedField;
  String? _selectedPromotion;
  //bool _isLoadingButton = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 10),
                      // Dropdown pour sélectionner une institution
                      DropdownButtonFormField<String>(
                        value: _selectedInstitution,
                        decoration: InputDecoration(
                          hintText: "Institution",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: greyColor,
                          filled: true,
                          //prefixIcon: const Icon(Icons.school),
                        ),
                        items: InstitutionData.institutions.keys
                            .map((institution) => DropdownMenuItem(
                                  value: institution,
                                  child: Text(institution),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedInstitution = value;

                            // Mettre à jour le champ matricule avec un préfixe en fonction de l'institution
                            if (value == "UNILUK") {
                              matriculeController.text = "#";
                            } else if (value == "ISTM") {
                              matriculeController.text = "T";
                            } else if (value == "ISTA") {
                              matriculeController.text = "B";
                            } else {
                              matriculeController.clear();
                            }

                            _selectedField = null;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      // Dropdown pour sélectionner une filière ou faculté
                      if (_selectedInstitution != null)
                        DropdownButtonFormField<String>(
                          value: _selectedField,
                          decoration: InputDecoration(
                            hintText: "Faculté ou Filière",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: greyColor,
                            filled: true,
                          ),
                          items: InstitutionData
                              .institutions[_selectedInstitution]!
                              .map((field) => DropdownMenuItem(
                                    value: field,
                                    child: Text(field),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedField = value;
                            });
                          },
                        ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // Dropdown pour sélectionner Étudiant ou Personnel
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
                        items: ['Etudiant', 'Personnel'].map((role) {
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
                        if (_selectedField != null) ...[
                          DropdownButtonFormField<String>(
                            value: _selectedPromotion,
                            decoration: InputDecoration(
                              hintText: "Sélectionnez une promotion",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: greyColor,
                              filled: true,
                            ),
                            items: InstitutionData.promotions[_selectedField]
                                    ?.map((promotion) {
                                  return DropdownMenuItem(
                                    value: promotion,
                                    child: Text(promotion),
                                  );
                                }).toList() ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                _selectedPromotion = value;
                              });
                            },
                          ),
                        ]
                      ],
                      const SizedBox(height: 10),
                      Container(
                          padding: const EdgeInsets.only(top: 0, left: 3),
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(vertical: 16),
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
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
