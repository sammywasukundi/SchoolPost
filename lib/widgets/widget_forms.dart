// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:school_post/models/other_classes/institution_data.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/view/drawer/account_view.dart';
import 'package:school_post/widgets/widget_list.dart';

class FormHoraire {
  static final String _selectedPromotion =
      InstitutionData.promotions.keys.first;

  void showFormHoraire(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ajouter un horaire',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: blueColor),
                      ),
                      IconButton(
                        onPressed: () {
                          MyListWidget().ListHoraire(context);
                        },
                        icon: Icon(Icons.list_alt_outlined,color: blueColor,),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "Date de début",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        hoverColor: blackColor,
                        fillColor: whiteColor,
                        filled: true,
                        prefixIcon: Icon(Icons.date_range_outlined)),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        // Handle date selection
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        hintText: "Date de fin",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        hoverColor: blackColor,
                        fillColor: whiteColor,
                        filled: true,
                        prefixIcon: Icon(Icons.date_range_outlined)),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        // Handle date selection
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Promotion',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: whiteColor,
                      filled: true,
                    ),
                    items: InstitutionData.promotions[_selectedPromotion]!
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
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Cours',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: whiteColor,
                      filled: true,
                    ),
                    items: <String>['Cours 1', 'Cours 2', 'Cours 3']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle cours selection
                    },
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showQuestion(context, 'Enregistrement',
                              'Voulez-vous vraiment enregistrer ces informations ?');
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
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
              ),
            ),
          );
        },
      );
    });
  }

  static void showFormCours(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ajouter un cours',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: blueColor),
                    ),
                    IconButton(
                      onPressed: () {
                        MyListWidget().ListCours(context);
                      },
                      icon: Icon(Icons.list_alt_outlined,color: blueColor,),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Intitulé du cours",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      hoverColor: blackColor,
                      fillColor: whiteColor,
                      filled: true,
                      prefixIcon: Icon(Icons.book_outlined)),
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Unité d\'enseignement',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: whiteColor,
                    filled: true,
                  ),
                  items: <String>['UE 1', 'UE 2', 'UE 3'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Handle cours selection
                  },
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showQuestion(context, 'Enregistrement',
                            'Voulez-vous vraiment enregistrer ces informations ?');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
            ),
          );
        },
      );
    });
  }

  static void showFormUE(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ajouter une unité d\'enseignement',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: blueColor),
                    ),
                    IconButton(
                      onPressed: () {
                        MyListWidget().ListUE(context);
                      },
                      icon: Icon(Icons.list_alt_outlined,color: blueColor,),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Nom de l'unité d'enseignement",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      hoverColor: blackColor,
                      fillColor: whiteColor,
                      filled: true,
                      prefixIcon: Icon(Icons.school_outlined)),
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Description de l'unité d'enseignement",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      hoverColor: blackColor,
                      fillColor: whiteColor,
                      filled: true,
                      prefixIcon: Icon(Icons.description_outlined)),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showQuestion(context, 'Enregistrement',
                            'Voulez-vous vraiment enregistrer ces informations ?');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
            ),
          );
        },
      );
    });
  }

  static void showFormSalle(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ajouter une salle',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: blueColor),
                    ),
                    IconButton(
                      onPressed: () {
                        MyListWidget().ListSalle(context);
                      },
                      icon: Icon(Icons.list_alt_outlined,color: blueColor,),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Nom de la salle",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      hoverColor: blackColor,
                      fillColor: whiteColor,
                      filled: true,
                      prefixIcon: Icon(Icons.room_outlined)),
                ),
                SizedBox(height: 15),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Description de la salle",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                      hoverColor: blackColor,
                      fillColor: whiteColor,
                      filled: true,
                      prefixIcon: Icon(Icons.description_outlined)),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showQuestion(context, 'Enregistrement',
                            'Voulez-vous vraiment enregistrer ces informations ?');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
            ),
          );
        },
      );
    });
  }

  static void showProfileDialog(BuildContext context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType
          .noHeader, // Replace with a valid constant, e.g., DialogType.INFO
      animType: AnimType.bottomSlide,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  'assets/johnDoe.png'), // Replace with your profile image asset
            ),
            SizedBox(height: 16),
            Text(
              'Noms: John Doe',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email: john.doe@example.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Institution: XYZ Institute',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Faculté: Computer Science',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Promotion: 2023',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Matricule: 123456',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Voir mes info',
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Text(
                    'Retour',
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ).show();
  }

  void showSearchDialog(
      BuildContext context, TextEditingController searchController) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.bottomSlide,
      //dialogBackgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          //height: 70,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 14.0),
          margin: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent, // Set the fill color of the TextField
                  hintText: 'Rechercher',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Handle search input
                },
              ),
            ],
          ),
        ),
      ),
    ).show();
  }
}
