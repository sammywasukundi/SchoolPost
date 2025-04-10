import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/widgets/widget_list_promotion.dart';
import 'package:school_post/models/promotion_model.dart';

class FormPromotion {
  final _formKey = GlobalKey<FormState>();
  String? _selectedFiliere;
  final _nompromotionController = TextEditingController();

  Future<void> ajouterPromotion(BuildContext context) async {
    if (_nompromotionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      String id = FirebaseFirestore.instance.collection('promotions').doc().id;
      Promotion promotion = Promotion(
        idProm: id,
        idFiliere: _selectedFiliere,
        Libelle: _nompromotionController.text,
      );
      await Promotion.create(promotion);
      if (context.mounted) {
        showSuccess(
            context, "Succès", "Ptromotion enregistrée avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  Future<void> modifierPromotion(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('promotions')
          .doc(id)
          .update({
        'Libelle': _nompromotionController.text,
     
       
      });

      if (context.mounted) {
        //Navigator.pop(context);
        showSuccess(context, "Succès", "informations sur la promotion  modifiées avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur', "Modification échouée: ${e.toString()}");
    }
  }

  void showFormPromotion(BuildContext context,{Promotion? Libelle}) {
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
                              'Ajouter une promotion',
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
                                            WidgetListPromotion()));
                              },
                              icon: Icon(
                                Icons.list_alt_outlined,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _nompromotionController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Nom de la promotion",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              hoverColor: blackColor,
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.person_outlined)),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _selectedFiliere,
                          decoration: InputDecoration(
                            labelText: 'Filière',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: whiteColor,
                            filled: true,
                          ),
                          items: <String>["pre-programmé", "A-programmer"]
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle promotion selection
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
                                  if (Libelle== null) {
                                    ajouterPromotion(context);
                                  } else {
                                    modifierPromotion(context, Libelle.Libelle);
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
                                Libelle== null ? "Ajouter" : "Modifier",
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
