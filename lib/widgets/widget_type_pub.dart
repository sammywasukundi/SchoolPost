import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/widgets/widget_type_pub_list.dart';

class FormTypePub {
  final _formKey = GlobalKey<FormState>();
  final _nomtypepubController = TextEditingController();
  final _desctypepubController = TextEditingController();

  void showFormTypePub(BuildContext context) {
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
                              'Ajouter un type de publication',
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
                              hintText: "Nom du type de publication",
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
                          controller: _desctypepubController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Description du type de publication",
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
