import 'package:flutter/material.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/widgets/widget_list.dart';

import '../theme/app_colors.dart';

class FormAnneeAcademique {
  final _formKey = GlobalKey<FormState>();
  final _nomfiliereController = TextEditingController();

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
                              'Ajouter une année académique',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: blueColor),
                            ),
                            IconButton(
                              onPressed: () {
                                MyListWidget().ListHoraire(context);
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
                              hintText: "Année académique",
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
                        TextFormField(
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
                              // Handle the selected date
                            }
                          },
                        ),
                        SizedBox(height: 16),
                        TextFormField(
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
                              // Handle the selected date
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
                                showSuccess(context, "Succès",
                                    "Enregistrement avec réussi avec succès");
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
