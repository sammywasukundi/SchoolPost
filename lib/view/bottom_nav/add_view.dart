import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

class AddScrenn extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.schedule_outlined,
      text: 'Horaire',
      onTap: () {} ,
    ),
    MenuItem(
      icon: Icons.info_outlined,
      text: 'Communication',
      onTap: () {},
    ),
    MenuItem(
      icon: Icons.settings_outlined,
      text: 'Paramètres',
      onTap: () {},
    ),
    MenuItem(
      icon: Icons.notifications_outlined,
      text: 'Notifications',
      onTap: () {},
    ),
    MenuItem(
      icon: Icons.message_outlined,
      text: 'Messages',
      onTap: () {},
    ),
    MenuItem(
      icon: Icons.camera_outlined,
      text: 'Camera',
      onTap: () {},
    ),
  ];

  AddScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 18.0,
            mainAxisSpacing: 18.0,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return _gridMenuCard(item);
          },
        ),
      ),
    );
  }

  Widget _gridMenuCard(MenuItem item) {
    return GestureDetector(
      onTap: item.onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 30,
              color: blueColor,
            ),
            const SizedBox(height: 8.0),
            Text(
              item.text,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600, color: blueColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  MenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}
