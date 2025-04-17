import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_gridview.dart';
import 'package:school_post/widgets/widget_notification.dart';
import 'package:school_post/widgets/widget_publication.dart';

class AddScrenn extends StatefulWidget {
  const AddScrenn({super.key});

  @override
  _AddScrennState createState() => _AddScrennState();
}

class _AddScrennState extends State<AddScrenn> {
  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.post_add_outlined,
      text: 'Publier',
      onTap: (BuildContext context) {
        FormPublication().showFormPublication(context);
      },
    ),
    MenuItem(
      icon: Icons.published_with_changes_outlined,
      text: 'Publications',
      onTap: (BuildContext context) {
        
      },
    ),
    MenuItem(
      icon: Icons.notification_important_outlined,
      text: 'Notifiications',
      onTap: (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationScreen(),
          ),
        );
      },
    ),
     
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
            childAspectRatio: 1.15,
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
