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
        style: TextStyle(color: Colors.green[500],fontWeight: FontWeight.w600),
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
        style: TextStyle(color: Colors.red[500],fontWeight: FontWeight.w600),
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
        style: TextStyle(color: blackColor,fontWeight: FontWeight.w600), 
      ),
    ),
    btnOk: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Oui",
        style: TextStyle(color: Colors.orange[500],fontWeight: FontWeight.w600),
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
        style: TextStyle(color: blackColor,fontWeight: FontWeight.w600), 
      ),
    ),
    btnOk: TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Oui",
        style: TextStyle(color: Colors.orange[500],fontWeight: FontWeight.w600),
      ),
    ),
  ).show();
}

