import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/widgets/widget_list_filiere.dart';

class FormFiliere {
  final _formKey = GlobalKey<FormState>();
  final _nomfiliereController = TextEditingController();
  String? _selectedDomaine;

  void showFormFiliere(BuildContext context) {
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
                              'Ajouter une filière',
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
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
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
