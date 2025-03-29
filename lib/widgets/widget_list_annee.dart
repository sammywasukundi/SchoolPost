import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/models/AnneeAcadem_model.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/theme/app_dialog.dart';
import 'package:school_post/widgets/widget_anneeacademique.dart';

class WidgetListAnnee extends StatefulWidget {
  const WidgetListAnnee({super.key});

  @override
  State<WidgetListAnnee> createState() => _WidgetListAnneeState();
}

class _WidgetListAnneeState extends State<WidgetListAnnee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listes d\'années académiques',
          style: TextStyle(
            color: blueColor,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: blueColor),
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('anneeAcadems').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: blueColor,));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Aucune année académique disponible.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var annee =
                  AnneeAcadem.fromMap(doc.data() as Map<String, dynamic>);

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
                    annee.Libelle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle:
                      Text('Début: ${annee.DateDebut} - Fin: ${annee.DateFin}'),
                  trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            FormAnneeAcademique().showFormAnnee(context, annee: annee);
                          },
                          leading: Icon(Icons.edit),
                          title: Text("Modifier"),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            _deleteAnnee(annee.idAnne);
                          },
                          leading: Icon(Icons.delete, color: Colors.red),
                          title: Text("Supprimer"),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _deleteAnnee(String id) async {
    await FirebaseFirestore.instance
        .collection('anneeAcadems')
        .doc(id)
        .delete();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Année supprimée avec succès')));
    showSuccess(context, 'Suppression', 'Année supprimée avec succès');
  }
}
