import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/view/bottom_nav/add_view.dart';
import 'package:school_post/view/bottom_nav/communicate_view.dart';
import 'package:school_post/view/bottom_nav/dash_view.dart';
import 'package:school_post/view/drawer/about_view.dart';
import 'package:school_post/view/drawer/account_view.dart';
import 'package:school_post/widgets/widget%20_title.dart';
import 'package:school_post/widgets/widget_notificationButton.dart';
import 'package:school_post/widgets/widget_profilButton.dart';
import 'package:school_post/widgets/widget_searchButton.dart';

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
    const AddScreen(),
    const CommunicateScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
              onPressed: () {},
            ),
            ProfileButton(
              iconColor: blueColor,
              onPressed: () {},
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.zero),
                  child: SchoolPostTitle(
                    blueColor: blueColor,
                    yellowColor: yellowColor,
                  )),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Mon compte'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('À propos'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
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
          backgroundColor: blueColor,
          selectedItemColor: yellowColor,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          items: [
            _bottomNavItem(Icons.dashboard, 'Tableau de bord'),
            _bottomNavItem(Icons.add, 'Ajouter'),
            _bottomNavItem(Icons.comment, 'Communications')
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
        color: yellowColor,
      ),
      activeIcon: Icon(
        icon,
        color: yellowColor,
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
