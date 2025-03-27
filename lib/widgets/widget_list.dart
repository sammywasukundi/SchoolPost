import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/widgets/widget_forms.dart';

class MyListWidget extends StatelessWidget {
  const MyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listes',
          style: TextStyle(
            color: blueColor,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 2.0,
        backgroundColor: bgColor,
        shadowColor: bgColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: blueColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('List Horaire'),
                  onTap: () => ListHoraire(context),
                ),
                ListTile(
                  title: Text('List Cours'),
                  onTap: () => ListCours(context),
                ),
                ListTile(
                  title: Text('List Unité d\'enseignement'),
                  onTap: () => ListUE(context),
                ),
                ListTile(
                  title: Text('List Salle'),
                  onTap: () => ListSalle(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void ListHoraire(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Listes d\'horaires disponibles ',
              style: TextStyle(
                color: blueColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 2.0,
            backgroundColor: bgColor,
            shadowColor: bgColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: blueColor),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // replace with the actual item count
                  itemBuilder: (context, index) {
                    return Card(
                      color: greyColor,
                      shadowColor: blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      elevation: 0.5,
                      child: ListTile(
                        title: Text(
                          'Nom de l\'horaire',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('snapshot.child("address").value.toString()'),
                        leading: CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Text('snapshot.child("sn").value.toString()'),
                        ),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  FormHoraire().showFormHoraire(context);
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Modifier"),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showQuestion(context, 'Suppression', 'Voulez-vous vraiment supprimer cet horaire?');
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Supprimer"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ListCours(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Listes de cours',
              style: TextStyle(
                color: blueColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 2.0,
            backgroundColor: bgColor,
            shadowColor: bgColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: blueColor),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // replace with the actual item count
                  itemBuilder: (context, index) {
                    return Card(
                      color: greyColor,
                      shadowColor: blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      elevation: 0.5,
                      child: ListTile(
                        title: Text(
                          'Nom du cours',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('snapshot.child("address").value.toString()'),
                        leading: CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Text('snapshot.child("sn").value.toString()'),
                        ),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  FormHoraire.showFormCours(context);
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Modifier"),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showQuestion(context, 'Suppression', 'Voulez-vous vraiment supprimer ce cours?');
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Supprimer"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ListUE(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Listes d\'unités d\'enseignement',
              style: TextStyle(
                color: blueColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 2.0,
            backgroundColor: bgColor,
            shadowColor: bgColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: blueColor),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // replace with the actual item count
                  itemBuilder: (context, index) {
                    return Card(
                      color: greyColor,
                      shadowColor: blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      elevation: 0.5,
                      child: ListTile(
                        title: Text(
                          'Nom de l\'unité d\'enseignement',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('snapshot.child("address").value.toString()'),
                        leading: CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Text('snapshot.child("sn").value.toString()'),
                        ),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  FormHoraire.showFormUE(context);
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Modifier"),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showQuestion(context, 'Suppression', 'Voulez-vous vraiment supprimer cette unité d\'enseignement?');
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Supprimer"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void ListSalle(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Listes de salles',
              style: TextStyle(
                color: blueColor,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 2.0,
            backgroundColor: bgColor,
            shadowColor: bgColor,
            centerTitle: true,
            iconTheme: IconThemeData(color: blueColor),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // replace with the actual item count
                  itemBuilder: (context, index) {
                    return Card(
                      color: greyColor,
                      shadowColor: blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      elevation: 0.5,
                      child: ListTile(
                        title: Text(
                          'Nom de la salle',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text('snapshot.child("address").value.toString()'),
                        leading: CircleAvatar(
                          backgroundColor: whiteColor,
                          child: Text('snapshot.child("sn").value.toString()'),
                        ),
                        trailing: PopupMenuButton(
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {
                                  FormHoraire.showFormSalle(context);
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text("Modifier"),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showQuestion(context, 'Suppression', 'Voulez-vous vraiment supprimer cette salle?');
                                },
                                leading: const Icon(Icons.delete),
                                title: const Text("Supprimer"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
