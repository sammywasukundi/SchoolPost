import 'package:flutter/material.dart';
import 'package:school_post/theme/app_dialog.dart';

import '../theme/app_colors.dart';

class FormPublication {
  final _formKey = GlobalKey<FormState>();
  final _titreController = TextEditingController();
  final _contenuController = TextEditingController();
  DateTime? _dateEnregistrement;
  DateTime? _dateDebut;
  DateTime? _dateFin;
  String? _typePublication;
  String? _typePortee;
  bool _isArchive = false;
  String? _typeCommentaire;

  void showFormPublication(BuildContext context) {
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
                        Text(
                          textAlign: TextAlign.center,
                          'Ajouter une publication',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: blueColor),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _titreController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Titre de la publication",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.title)),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: _contenuController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: "Contenu de la publication",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: whiteColor,
                              filled: true,
                              prefixIcon: Icon(Icons.description)),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _typePublication,
                          items: [
                            DropdownMenuItem(
                                value: "privee", child: Text("Privée")),
                            DropdownMenuItem(
                                value: "public", child: Text("Public")),
                            DropdownMenuItem(
                                value: "tous", child: Text("Pour tous")),
                          ],
                          onChanged: (value) {
                            _typePublication = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Type de publication",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: whiteColor,
                              filled: true),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _typePortee,
                          items: [
                            DropdownMenuItem(
                                value: "locale", child: Text("Locale")),
                            DropdownMenuItem(
                                value: "regionale", child: Text("Régionale")),
                            DropdownMenuItem(
                                value: "nationale", child: Text("Nationale")),
                          ],
                          onChanged: (value) {
                            _typePortee = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Type de portée",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: whiteColor,
                              filled: true),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: _typeCommentaire,
                          items: [
                            DropdownMenuItem(
                                value: "a_commenter",
                                child: Text("À commenter")),
                            DropdownMenuItem(
                                value: "sans_commenter",
                                child: Text("Sans commenter")),
                            DropdownMenuItem(
                                value: "privee", child: Text("Privée")),
                          ],
                          onChanged: (value) {
                            _typeCommentaire = value;
                          },
                          decoration: InputDecoration(
                              hintText: "Type de commentaire",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide.none,
                              ),
                              fillColor: whiteColor,
                              filled: true),
                        ),
                        SizedBox(height: 16),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // Logic to pick date for _dateEnregistrement
                        //   },
                        //   child: Text("Date d'enregistrement"),
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: blueColor,
                        //   ),
                        // ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Logic to pick date for _dateDebut
                            },
                            child: Text(
                              "Date de début",
                              style: TextStyle(color: whiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: blueColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Logic to pick date for _dateFin
                            },
                            child: Text(
                              "Date de fin",
                              style: TextStyle(color: whiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: blueColor,
                            ),
                          ),
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: CheckboxListTile(
                                title: Text("Archivé"),
                                value: _isArchive,
                                onChanged: (value) {
                                  _isArchive = value ?? false;
                                },
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 2),
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Logic to pick a file
                                  },
                                  icon: Icon(
                                    Icons.attach_file,
                                    color: whiteColor,
                                  ),
                                  label: Text(
                                      style: TextStyle(color: whiteColor),
                                      "Charger un fichier"),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    backgroundColor: blueColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                showSuccess(context, "Succès",
                                    "Publication enregistrée avec succès");
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
