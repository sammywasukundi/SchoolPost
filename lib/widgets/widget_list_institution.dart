import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/models/data_model.dart';
import 'package:school_post/theme/app_colors.dart';
import 'package:school_post/widgets/widget_institution.dart';

class WidgetListInstitution extends StatefulWidget {
  const WidgetListInstitution({super.key});

  @override
  State<WidgetListInstitution> createState() => _WidgetListInstitutionState();
}

class _WidgetListInstitutionState extends State<WidgetListInstitution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Listes des institutions',
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
        stream: FirebaseFirestore.instance.collection('institutions').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: blueColor,
            ));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('Aucune institution disponible.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var doc = snapshot.data!.docs[index];
              var nomInstitution =
                  Institution.fromMap(doc.data() as Map<String, dynamic>);

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
                    nomInstitution.Libelle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  subtitle: Text('L\'institution peut être modifée ou supprimée'),
                  trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            FormInstitution().showFormInstitution(context);
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
                            //_deleteAnnee(annee.idAnne);
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
}
