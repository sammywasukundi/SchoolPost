import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_title.dart';

import '../../theme/app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: SchoolPostTitle(blueColor: blueColor, yellowColor: yellowColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          //color: whiteColor,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'SchoolPost est une Plateforme mobile conçu dans l\'objectif d\'aider tous les étudiants de L\'UNILUK,L\'ISTA et L\'ISTM lukanga de chaque fois avoir les informations concernant l\'institution et leurs filières en temps réel.La plateforme remplit les rôles d\'une valve électronique',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: blackColor),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Travail fait par les étudiants de la faculté des sciences informatiques,promotion L4,année academique 2024-2025',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: blackColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
