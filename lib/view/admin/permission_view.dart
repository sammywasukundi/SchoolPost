import 'package:flutter/material.dart';
import 'package:school_post/widgets/widget_gridview.dart';
import 'package:school_post/widgets/widget_permission.dart';

class PermissionView extends StatefulWidget {
  const PermissionView({super.key});

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> {
  final List<MenuPermission> menuPermissions = [
    MenuPermission(
      icon: Icons.supervised_user_circle_outlined,
      text: 'Types d\'utilisateurs',
      onTap: (BuildContext context) {
        WidgetPermission(context);
      }
    ),
    MenuPermission(
      icon: Icons.comment_outlined,
      text: 'Commentaire',
      onTap: (BuildContext context) {
        
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
            childAspectRatio: 1.15, // Adjust the aspect ratio to reduce size
          ),
          itemCount: menuPermissions.length,
          itemBuilder: (context, index) {
            final item = menuPermissions[index];
            return buildButtonBudget(context, item.icon, item.text,
          onTap: () => item.onTap(context));
          },
        ),
      ),
    );
  }
}

class MenuPermission {
  final IconData icon;
  final String text;
  final Function(BuildContext) onTap;
  MenuPermission({
    required this.icon,
    required this.text,
    required this.onTap,
  });
}