import 'package:flutter/material.dart';
import 'package:school_post/models/domaine_model.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_lists/widget_list_domaine.dart';

class FormDomaine {
  final _nomdomaineController = TextEditingController();
  final _formKey = GlobalKey<FormState>();  
  String? _selectedInstitution;
  String? nomInstitution;

Future<void> ajouterDomaine(BuildContext context) async {
    if (_nomdomaineController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      String id = FirebaseFirestore.instance.collection('domaines').doc().id;
      Domaine domaine = Domaine(
        idDomne: id,
        nomDomne: _nomdomaineController.text,
        idInstitution: _selectedInstitution,
        nomInstitution: nomInstitution ?? '',
       
      );
      await Domaine.create(domaine);
      if (context.mounted) {
        showSuccess(
            context, "Succès", "domaine enregistrée avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  Future<void> modifierDomaine(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('domaines')
          .doc(id)
          .update({
        'nomDomne': _nomdomaineController.text.trim(),
        'idInstitution': _selectedInstitution,
        'nomInstitution': nomInstitution
       
      });

      if (context.mounted) {
        //Navigator.pop(context);
        showSuccess(context, "Succès", "informations sur le Domaine modifiées avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur', "Modification échouée: ${e.toString()}");
    }
  }

  void showFormDomaine(BuildContext context,{Domaine? domaine}) {
    if (domaine != null) {
      _nomdomaineController.text = domaine.nomDomne;
      _selectedInstitution = domaine.idInstitution;
    } else {
      _nomdomaineController.clear();
      _selectedInstitution = null;
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
                              domaine == null
                                ? 'Ajouter un domaine'
                                : 'Modifier le domaine',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: blueColor),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WidgetListDomaine()));
                              },
                              icon: Icon(
                                Icons.list_alt_outlined,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _nomdomaineController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Nom de domaine",
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
                          future: FirebaseFirestore.instance
                            .collection('institutions')
                            .get(),
                          builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                            return CircularProgressIndicator(
                              color: blueColor,
                              strokeWidth: 2.0,
                            );
                          } else if (snapshot.hasError) {
                            return Text('Erreur de chargement des institutions');
                          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return Text('Aucune institution trouvée');
                          } else {
                            List<DropdownMenuItem<String>> items = snapshot.data!.docs
                              .map((doc) {
                            return DropdownMenuItem<String>(
                              value: doc.id,
                              child: Text(doc['Libelle'] ?? 'sans nom'),
                            );
                            }).toList();

                            return DropdownButtonFormField<String>(
                            value: _selectedInstitution,
                            decoration: InputDecoration(
                              labelText: 'Institution',
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                              ),
                              fillColor: whiteColor,
                              filled: true,
                            ),
                            items: items,
                            onChanged: (String? newValue) {
                              _selectedInstitution = newValue;
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
                              
                                  if (domaine== null) {
                                    ajouterDomaine(context);
                                  } else {
                                    modifierDomaine(context, domaine.idDomne);
                                  }
                                // showSuccess(context, "Succès",
                                //     "Enregistrement avec réussi avec succès");
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
                                domaine == null ? "Ajouter" : "Modifier",
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
