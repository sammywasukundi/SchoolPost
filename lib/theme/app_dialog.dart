// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

void showSuccess(BuildContext context, String title, String content) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    width: 300,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    desc: content,
    btnOk: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Ok",
        style: TextStyle(color: Colors.green[500], fontWeight: FontWeight.w600),
      ),
    ),
  ).show();
}

void showError(BuildContext context, String title, String content) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    width: 300,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    desc: content,
    btnOk: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Ok",
        style: TextStyle(color: Colors.red[500], fontWeight: FontWeight.w600),
      ),
    ),
  ).show();
}

void showQuestion(BuildContext context, String title, String content) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.question,
    width: 300,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    desc: content,
    btnCancel: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Annuler",
        style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
      ),
    ),
    btnOk: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Oui",
        style:
            TextStyle(color: Colors.orange[500], fontWeight: FontWeight.w600),
      ),
    ),
  ).show();
}

void showWarning(BuildContext context, String title, String content) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    width: 300,
    buttonsBorderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
    headerAnimationLoop: false,
    animType: AnimType.bottomSlide,
    title: title,
    desc: content,
    btnCancel: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Annuler",
        style: TextStyle(color: blackColor, fontWeight: FontWeight.w600),
      ),
    ),
    btnOk: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Oui",
        style:
            TextStyle(color: Colors.orange[500], fontWeight: FontWeight.w600),
      ),
    ),
  ).show();
}

void updateUser(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled:
        true, // Pour permettre un défilement si le contenu dépasse
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ), // Inclut les marges et gère le clavier
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Update Details",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: blackColor,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: greyColor,
                prefixIcon: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: greyColor,
                prefixIcon: Icon(Icons.email, color: Colors.blue),
              ),
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  showQuestion(context, 'Attention',
                      'Voulez-vous vraiment modifier vos informations ?');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Update",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
