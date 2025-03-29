import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/models/AnneeAcadem_model.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_list_annee.dart';

import '../theme/app_colors.dart';

class FormAnneeAcademique {
  final _formKey = GlobalKey<FormState>();
  final _libelleController = TextEditingController();
  final _dateDebutController = TextEditingController();
  final _dateFinController = TextEditingController();

  Future<void> ajouterAnneeAcademique(BuildContext context) async {
    if (_libelleController.text.isEmpty ||
        _dateDebutController.text.isEmpty ||
        _dateFinController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      String id =
          FirebaseFirestore.instance.collection('anneeAcadems').doc().id;
      AnneeAcadem anneeAcademique = AnneeAcadem(
        idAnne: id,
        Libelle: _libelleController.text,
        DateDebut: _dateDebutController.text,
        DateFin: _dateFinController.text,
      );
      await AnneeAcadem.create(anneeAcademique);
      if (context.mounted) {
          showSuccess(
              context, "Succès", "Année académique enregistrée avec succès");

      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  void showFormAnnee(BuildContext context) {
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
                              'Année académique',
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
                                  builder: (context) => WidgetListAnnee(),
                                  ),
                                );
                                },
                              icon: Icon(
                                Icons.list_alt_outlined,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _libelleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Année académique",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none,
                            ),
                            hoverColor: blackColor,
                            fillColor: whiteColor,
                            filled: true,
                            prefixIcon: Icon(Icons.person_outlined),
                          ),
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _dateDebutController,
                          decoration: InputDecoration(
                            labelText: 'Date de début',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: whiteColor,
                            filled: true,
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              _dateDebutController.text = formattedDate;
                            }
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _dateFinController,
                          decoration: InputDecoration(
                            labelText: 'Date de fin',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: whiteColor,
                            filled: true,
                            prefixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formattedDate =
                                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              _dateFinController.text = formattedDate;
                            }
                          },
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
                                ajouterAnneeAcademique(context);
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
                                "Ajouter",
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
