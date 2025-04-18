import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/view/admin/dash_admin_view.dart';
import 'package:school_post/view/admin/permission_view.dart';
import 'package:school_post/view/bottom_nav/add_view.dart';
import 'package:school_post/view/bottom_nav/dash_view.dart';
import 'package:school_post/view/bottom_nav/about_view.dart';
import 'package:school_post/view/drawer/account_view.dart';
import 'package:school_post/widgets/widget_forms.dart';
import 'package:school_post/widgets/widget_notification.dart';
import 'package:school_post/widgets/widget_notification_button.dart';
import 'package:school_post/widgets/widget_profil_button.dart';
import 'package:school_post/widgets/widget_search_button.dart';
import 'package:school_post/widgets/widget_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    const DashScreen(),
    const AddScrenn(),
    const AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 2.0,
          backgroundColor: bgColor,
          shadowColor: bgColor,
          actions: [
            SizedBox(
              width: 40,
              child: SearchButton(
                iconColor: blueColor,
                searchController: searchController,
              ),
            ),
            NotificationsButton(
              iconColor: blueColor,
              notificationCount: 3,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            ),
            ProfileButton(
              iconColor: blueColor,
              onPressed: () {
                FormHoraire.showProfileDialog(context);
              },
            ),
          ],
        ),
        drawer: Drawer(
          width: 250,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.zero),
                  child: SchoolPostTitle(
                    blueColor: blueColor,
                    yellowColor: yellowColor,
                  )),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Accueil'),
                onTap: () {
                  setState(() {
                    _currentIndex = 0; // Update to the index of the DashScreen
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined),
                title: const Text('Géneral'),
                onTap: () {
                  setState(() {
                    _currentIndex = 1; // Update to the index of the AddScrenn
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Qui sommes-nous ?'),
                onTap: () {
                  setState(() {
                    _currentIndex =
                        2; 
                  });
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Mon compte'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Déconnexion'),
                onTap: () {
                  showQuestion(context, 'Déconnexion',
                      'Voulez-vous vraiment vous déconnecter ?');
                },
              ),
            ],
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          //elevation: 6,
          backgroundColor: bgColor,
          selectedItemColor: blueColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.home_outlined, 'Accueil'),
            _bottomNavItem(Icons.dashboard_customize_outlined, 'Géneral'),
            _bottomNavItem(Icons.question_mark_outlined, 'Qui sommes-nous ?')
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  _bottomNavItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: blueColor,
      ),
      activeIcon: Icon(
        icon,
        color: blueColor,
      ),
      label: title,
    );
  }

  onTabTapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    const DashScreen(),
    const DashAdminView(),
    const PermissionView()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 2.0,
          backgroundColor: bgColor,
          shadowColor: bgColor,
          actions: [
            SizedBox(
              width: 40,
              child: SearchButton(
                iconColor: blueColor,
                searchController: searchController,
              ),
            ),
            NotificationsButton(
              iconColor: blueColor,
              notificationCount: 3,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            ),
            ProfileButton(
              iconColor: blueColor,
              onPressed: () {
                FormHoraire.showProfileDialog(context);
              },
            ),
          ],
        ),
        drawer: Drawer(
          width: 250,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.zero),
                  child: SchoolPostTitle(
                    blueColor: blueColor,
                    yellowColor: yellowColor,
                  )),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Accueil'),
                onTap: () {
                  setState(() {
                    _currentIndex = 0; // Update to the index of the DashScreen
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Paramètres'),
                onTap: () {
                  setState(() {
                    _currentIndex = 1; // Update to the index of the AddScrenn
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.admin_panel_settings_outlined),
                title: const Text('Permissions'),
                onTap: () {
                  setState(() {
                    _currentIndex =
                        2; // Update to the index of the CommunicateScreen
                  });
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Mon compte'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Déconnexion'),
                onTap: () {
                  showQuestion(context, 'Déconnexion',
                      'Voulez-vous vraiment vous déconnecter ?');
                },
              ),
            ],
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          //elevation: 6,
          backgroundColor: bgColor,
          selectedItemColor: blueColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.home_outlined, 'Accueil'),
            _bottomNavItem(Icons.settings_outlined, 'Paremètres'),
            _bottomNavItem(Icons.admin_panel_settings_outlined, 'Permissions')
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  _bottomNavItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: blueColor,
      ),
      activeIcon: Icon(
        icon,
        color: blueColor,
      ),
      label: title,
    );
  }

  onTabTapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    const DashScreen(),
    const AddScrenn(),
    const AboutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 2.0,
          backgroundColor: bgColor,
          shadowColor: bgColor,
          actions: [
            SizedBox(
              width: 40,
              child: SearchButton(
                iconColor: blueColor,
                searchController: searchController,
              ),
            ),
            NotificationsButton(
              iconColor: blueColor,
              notificationCount: 3,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
            ),
            ProfileButton(
              iconColor: blueColor,
              onPressed: () {
                FormHoraire.showProfileDialog(context);
              },
            ),
          ],
        ),
        drawer: Drawer(
          width: 250,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.zero),
                  child: SchoolPostTitle(
                    blueColor: blueColor,
                    yellowColor: yellowColor,
                  )),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Accueil'),
                onTap: () {
                  setState(() {
                    _currentIndex = 0; 
                  });
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.dashboard_customize_outlined),
                title: const Text('Géneral'),
                onTap: () {
                  setState(() {
                    _currentIndex = 1; 
                  });
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.question_mark_outlined),
                title: const Text('Qui sommes-nous ?'),
                onTap: () {
                  setState(() {
                    _currentIndex =
                        2; 
                  });
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Mon compte'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Déconnexion'),
                onTap: () {
                  showQuestion(context, 'Déconnexion',
                      'Voulez-vous vraiment vous déconnecter ?');
                },
              ),
            ],
          ),
        ),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          //elevation: 6,
          backgroundColor: bgColor,
          selectedItemColor: blueColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.home_outlined, 'Accueil'),
            _bottomNavItem(Icons.post_add_outlined, 'Géneral'),
            _bottomNavItem(Icons.question_mark_rounded, 'Qui sommes-nous ?')
          ],
          onTap: onTabTapped,
        ),
      ),
    );
  }

  _bottomNavItem(IconData icon, String title) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: blueColor,
      ),
      label: title,
    );
  }

  onTabTapped(int index) {
    if (!mounted) return;
    setState(() {
      _currentIndex = index;
    });
  }
}
