import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_forms.dart';
import 'package:school_post/widgets/widget_gridview.dart';

class AddScrenn extends StatefulWidget {
  const AddScrenn({super.key});

  @override
  _AddScrennState createState() => _AddScrennState();
}

class _AddScrennState extends State<AddScrenn> {
  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.schedule_outlined,
      text: 'Horaire',
      onTap: (BuildContext context) {
        FormHoraire().showFormHoraire(context);
      },
    ),
    MenuItem(
      icon: Icons.info_outlined,
      text: 'Communication',
      onTap: (BuildContext context) {
        FormHoraire.showFormCommunication(context);
      },
    ),
    MenuItem(
      icon: Icons.settings_outlined,
      text: 'Paramètres',
      onTap: (BuildContext context) {},
    ),
    MenuItem(
      icon: Icons.notifications_outlined,
      text: 'Notifications',
      onTap: (BuildContext context) {},
    ),
    MenuItem(
      icon: Icons.message_outlined,
      text: 'Messages',
      onTap: (BuildContext context) {},
    ),
    MenuItem(
      icon: Icons.camera_outlined,
      text: 'Camera',
      onTap: (BuildContext context) {},
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
