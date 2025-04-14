import 'package:flutter/material.dart';
import 'package:school_post/models/filiere_model.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_post/theme/app_requirements.dart';
import 'package:school_post/widgets/widget_list_filiere.dart';

class FormFiliere {
  final _formKey = GlobalKey<FormState>();
  final _nomfiliereController = TextEditingController();
  String? _selectedDomaine;

Future<void> ajouterFiliere(BuildContext context) async {
    if (_nomfiliereController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    try {
      String id = FirebaseFirestore.instance.collection('filieres').doc().id;
      Filiere filiere = Filiere(
        idFlre: id,
        idDomaine:_selectedDomaine ,
        Libelle:_nomfiliereController.text,
      );
      await Filiere.create(filiere);
      if (context.mounted) {
        showSuccess(
            context, "Succès", "Institution enregistrée avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur lors de l\'enregistrement', "${e.toString()}");
      Navigator.pop(context);
    }
  }

  Future<void> modifierFiliere(BuildContext context, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection('filieres')
          .doc(id)
          .update({
        'Libelle': _nomfiliereController.text,
        'idDomaine': _selectedDomaine, 
      });

      if (context.mounted) {
        //Navigator.pop(context);
        showSuccess(context, "Succès", "informations sur l'institution  modifiées avec succès");
      }
    } catch (e) {
      showError(context, 'Erreur', "Modification échouée: ${e.toString()}");
    }
  }
  void showFormFiliere(BuildContext context,{Filiere? Libelle}){
    if (Libelle != null) {
      _nomfiliereController.text = Libelle.Libelle;
      _selectedDomaine = Libelle.idDomaine;
    } else {
      _nomfiliereController.clear();
      _selectedDomaine = null;
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
                              Libelle == null
                                ? 'Ajouter une filière'
                                : 'Modifeir la filière',
                              
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: blueColor),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WidgetListFiliere()));
                              },
                              icon: Icon(
                                Icons.list_alt_outlined,
                                color: blueColor,
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _nomfiliereController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Nom de la filière",
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
                          builder: (context, filieres) {
                            if (filieres.connectionState == ConnectionState.waiting) {
                              return CircularProgressIndicator(
                                color: blueColor,
                                strokeWidth: 2.0,
                              );
                            } else if (filieres.hasError) {
                              return Text('Erreur de chargement des domaines');
                            } else if (!filieres.hasData || filieres.data!.docs.isEmpty) {
                              return Text('Aucun domaine trouvé');
                            } else {
                              List<DropdownMenuItem<String>> items = filieres.data!.docs.map((doc) {
                                return DropdownMenuItem(
                                  value: doc.id,
                                  child: Text(doc['Libelle'] ?? 'sans nom'),
                                );
                              }).toList();
                              return DropdownButtonFormField<String>(
                                value: _selectedDomaine,
                                decoration: InputDecoration(
                                  labelText: 'Domaine',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  fillColor: whiteColor,
                                  filled: true,
                                ),
                                items: items,
                                onChanged: (String? newValue) {
                                  _selectedDomaine = newValue;
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
                              
                                  if (Libelle== null) {
                                    ajouterFiliere(context);
                                  } else {
                                    modifierFiliere(context, Libelle.Libelle);
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
