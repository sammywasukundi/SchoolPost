import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/models/TypePublication_model.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_lists/widget_type_pub_list.dart';

class FormTypePub {
  final _formKey = GlobalKey<FormState>();
  final _nomtypepubController = TextEditingController();
  final _desctypepubController = TextEditingController();

  Future<void> ajouterTypePub(BuildContext context) async {
    if (_nomtypepubController.text.isEmpty ||
        _desctypepubController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      String id = FirebaseFirestore.instance.collection('typePubs').doc().id;
      TypePub typePub = TypePub(
        idType: id,
        Libelle: _nomtypepubController.text,
        Description: _desctypepubController.text,
      );
      await TypePub.create(typePub);
      if (context.mounted) {
        showSuccess(
            context, "Succès", "Type de publication enregistré avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  Future<void> modifierTypePub(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance.collection('typePubs').doc(id).update({
        'Libelle': _nomtypepubController.text,
        'Description': _desctypepubController.text,
      });

      if (context.mounted) {
        showSuccess(
            context, "Succès", "Type de publication modifié avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur', "Modification échouée: ${e.toString()}");
    }
  }

  void showFormTypePub(BuildContext context, {TypePub? typePub}) {
    if (typePub != null) {
      _nomtypepubController.text = typePub.Libelle;
      _desctypepubController.text = typePub.Description;
    } else {
      _nomtypepubController.clear();
      _desctypepubController.clear();
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
                              typePub == null
                                  ? 'Ajouter un type'
                                  : "Modifier le type",
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
                                            WidgetListTypePub()));
                              },
                              icon: Icon(
                                Icons.list_alt_outlined,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _nomtypepubController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Nom du type",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              hoverColor: blackColor,
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.draw_outlined)),
                          validator: (val) => uValidator(
                            value: val,
                            isRequired: true,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _desctypepubController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Description du type",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              hoverColor: blackColor,
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.description_outlined)),
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
                                    _formKey.currentState!.validate()) {
                                  return;
                                }
                                if (typePub == null) {
                                  ajouterTypePub(context);
                                } else {
                                  modifierTypePub(context, typePub.idType);
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
                                typePub == null ? 'Ajouter' : 'Modifier',
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
