
import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_anneeacademique.dart';
import 'package:school_post/widgets/widget_domaine.dart';
import 'package:school_post/widgets/widget_filiere.dart';
import 'package:school_post/widgets/widget_gridview.dart';
import 'package:school_post/widgets/widget_institution.dart';
import 'package:school_post/widgets/widget_promotion.dart';

class DashAdminView extends StatefulWidget {
  const DashAdminView({super.key});

  @override
  _AddScrennState createState() => _AddScrennState();
}

class _AddScrennState extends State<DashAdminView> {
  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.schedule_outlined,
      text: 'Promotion',
      onTap: (BuildContext context) {
        FormPromotion().showFormPromotion(context);
      },
    ),
    MenuItem(
      icon: Icons.book_outlined,
      text: 'Filière',
      onTap: (BuildContext context) {
        FormFiliere().showFormFiliere(context);
      },
    ),
    MenuItem(
      icon: Icons.school_outlined,
      text: 'Domaine',
      onTap: (BuildContext context) {
        FormDomaine().showFormDomaine(context);
      },
    ),
    MenuItem(
      icon: Icons.room_outlined,
      text: 'Institution',
      onTap: (BuildContext context) {
        FormInstitution().showFormInstitution(context);
      },
    ),
    MenuItem(
      icon: Icons.domain_outlined,
      text: 'Année Académique',
      onTap: (BuildContext context) {
        FormAnneeAcademique().showFormAnnee(context);
      },
    ),
    MenuItem(
      icon: Icons.add_outlined,
      text: 'Publication',
      onTap: (BuildContext context) {
        
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return buildButtonBudget(context, item.icon, item.text,
                onTap: () => item.onTap(context));
          },
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String text;
  final Function(BuildContext) onTap;
  MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}