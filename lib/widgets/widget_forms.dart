// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:school_post/models/other_classes/institution_data.dart';
import 'package:school_post/theme/app_colors.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Ajouter un horaire',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                      fillColor: bgColor,
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
                      fillColor: bgColor,
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
                    fillColor: bgColor,
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
                    fillColor: bgColor,
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
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Se connecter",
                      style: TextStyle(color: whiteColor),
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

  static void showFormCommunication(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Ajoutez un com',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Field 1',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Field 2',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Handle form submission
                    Navigator.pop(context);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
