import 'package:flutter/material.dart';
import 'package:school_post/models/institution_model.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_list_institution.dart';
import '../theme/app_colors.dart';

class FormInstitution {
  final _formKey = GlobalKey<FormState>();
  final _nominstitutionController = TextEditingController();

  Future<void> ajouterInstitution(BuildContext context) async {
    if (_nominstitutionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      String id =
          FirebaseFirestore.instance.collection('institutions').doc().id;
      Institution institution = Institution(
        idInst: id,
        Libelle: _nominstitutionController.text,
      );
      await Institution.create(institution);
      if (context.mounted) {
        showSuccess(context, "Succès", "Institution enregistrée avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  Future<void> modifierInstitution(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('institutions')
          .doc(id)
          .update({
        'Libelle': _nominstitutionController.text.trim(),
      });

      if (context.mounted) {
        showSuccess(context, "Succès",
            "Informations sur l'institution modifiées avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur', "Modification échouée: ${e.toString()}");
    }
  }

  void showFormInstitution(BuildContext context, {Institution? institutions}) {
    if (institutions != null) {
      _nominstitutionController.text = institutions.Libelle;
    } else {
      _nominstitutionController.clear();
      
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              institutions == null
                                  ? 'Ajouter une institution'
                                  : 'Modifier l\' institution',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: blueColor),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WidgetListInstitution()));
                              },
                              icon: Icon(
                                Icons.list_alt_outlined,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _nominstitutionController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Nom de l\'institution",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              hoverColor: blackColor,
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.person_outlined)),
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState == null ||
                                    !_formKey.currentState!.validate()) {
                                  return;
                                }

                                if (institutions == null) {
                                  ajouterInstitution(context);
                                } else {
                                  modifierInstitution(context, institutions.idInst);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                backgroundColor: blueColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                institutions == null ? "Ajouter" : "Modifier",
                                style: TextStyle(color: whiteColor),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
          );
        },
      );
    });
  }
}
