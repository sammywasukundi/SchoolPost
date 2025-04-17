import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_forms/widget_anneeacademique.dart';
import 'package:school_post/widgets/widget_forms/widget_domaine.dart';
import 'package:school_post/widgets/widget_forms/widget_filiere.dart';
import 'package:school_post/widgets/widget_gridview.dart';
import 'package:school_post/widgets/widget_forms/widget_institution.dart';
import 'package:school_post/widgets/widget_forms/widget_promotion.dart';
import 'package:school_post/widgets/widget_publication.dart';
import 'package:school_post/widgets/widget_forms/widget_type_pub.dart';

class DashAdminView extends StatefulWidget {
  const DashAdminView({super.key});

  @override
  _AddScrennState createState() => _AddScrennState();
}

class _AddScrennState extends State<DashAdminView> {
  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.date_range_outlined,
      text: 'Année Académique',
      onTap: (BuildContext context) {
        FormAnneeAcademique().showFormAnnee(context);
      },
    ),
    MenuItem(
      icon: Icons.people_outline,
      text: 'Promotion',
      onTap: (BuildContext context) {
        FormPromotion().showFormPromotion(context);
      },
    ),
    MenuItem(
      icon: Icons.class_outlined,
      text: 'Filière',
      onTap: (BuildContext context) {
        FormFiliere().showFormFiliere(context);
      },
    ),
    MenuItem(
      icon: Icons.domain_outlined,
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
      icon: Icons.post_add_outlined,
      text: 'Publication',
      onTap: (BuildContext context) {
        FormPublication().showFormPublication(context);
      },
    ),
    MenuItem(
      icon: Icons.type_specimen_outlined,
      text: 'Type de publication',
      onTap: (BuildContext context) {
        FormTypePub().showFormTypePub(context);
      },
    ),
    MenuItem(
        icon: Icons.people_alt_outlined,
        text: 'Portée de publication',
        onTap: (BuildContext context) {
          //FormPorteePub().showFormPorteePub(context);
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            childAspectRatio: 1.15, // Adjust the aspect ratio to reduce size
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
