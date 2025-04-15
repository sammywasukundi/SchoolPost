import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_lists/widget_list_promotion.dart';
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
      String id = FirebaseFirestore.instance.collection('filières').doc().id;
      Promotion promotion = Promotion(
        idProm: id,
        idFiliere: _selectedFiliere,
        Libelle: _nompromotionController.text,
      );
      await Promotion.create(promotion);
      if (context.mounted) {
        showSuccess(context, "Succès", "Ptromotion enregistrée avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  Future<void> modifierPromotion(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance.collection('promotions').doc(id).update({
        'Libelle': _nompromotionController.text,
      });

      if (context.mounted) {
        //Navigator.pop(context);
        showSuccess(context, "Succès",
            "informations sur la promotion  modifiées avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur', "Modification échouée: ${e.toString()}");
    }
  }

  void showFormPromotion(BuildContext context, {Promotion? promotion}) {
    if (promotion != null) {
      _nompromotionController.text = promotion.Libelle;
      _selectedFiliere = promotion.idFiliere;
    } else {
      _nompromotionController.clear();
      _selectedFiliere = null;
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
                              promotion == null
                                ? 'Ajouter une promotion'
                                : 'Modifier la promotion',
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
                              validator: (val) => uValidator(
                                value: val,
                                isRequired: true
                              ),
                        ),
                        SizedBox(height: 16),
                        FutureBuilder<QuerySnapshot>(
                          future: FirebaseFirestore.instance.collection('filieres').get(),
                          builder: (context, promotion) {
                            if (promotion.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator(
                                color: blueColor,
                                strokeWidth: 2.0,
                              );
                            } else if (promotion.hasError) {
                              return Text('Erreur de chargement des filières');
                            } else if (!promotion.hasData || promotion.data!.docs.isEmpty) {
                              return Text('Aucune filière trouvée');
                            } else {
                              List<DropdownMenuItem<String>> items = promotion.data!.docs
                                  .map((doc) {
                                return DropdownMenuItem<String>(
                                  value: doc.id,
                                  child: Text(doc['Libelle'] ?? 'sans nom'),
                                );
                              }).toList();

                              return DropdownButtonFormField<String>(
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
                                items: items,
                                onChanged: (String? newValue) {
                                  _selectedFiliere = newValue;
                                },
                              );
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
                                if (promotion == null) {
                                  ajouterPromotion(context);
                                } else {
                                  modifierPromotion(context, promotion.idProm);
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
                                promotion == null ? "Ajouter" : "Modifier",
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
