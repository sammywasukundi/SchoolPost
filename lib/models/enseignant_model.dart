import 'package:cloud_firestore/cloud_firestore.dart';

class Enseignant {
  String idEnseignant;
  String idIdentite;
  String idAnneeAcademique;
  String idDomaine;

  Enseignant({
    required this.idEnseignant,
    required this.idIdentite,
    required this.idAnneeAcademique,
    required this.idDomaine,
  });

  Enseignant.empty()
      : idEnseignant = '',
        idIdentite = '',
        idAnneeAcademique = '',
        idDomaine = '';

  Map<String, dynamic> toMap() {
    return {
      'idEnseignant': idEnseignant,
      'idIdentite': idIdentite,
      'idAnneeAcademique': idAnneeAcademique,
      'idDomaine': idDomaine,
    };
  }

  factory Enseignant.fromMap(Map<String, dynamic> map) {
    return Enseignant(
      idEnseignant: map['idEnseignant'],
      idIdentite: map['idIdentite'],
      idAnneeAcademique: map['idAnneeAcademique'],
      idDomaine: map['idDomaine'],
    );
  }

  static Future<void> create(Enseignant enseignant) async {
    await FirebaseFirestore.instance
        .collection('enseignants')
        .doc(enseignant.idEnseignant)
        .set(enseignant.toMap());
  }

  static Future<Enseignant?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('enseignants').doc(id).get();
    if (doc.exists) {
      return Enseignant.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Enseignant enseignant) async {
    await FirebaseFirestore.instance
        .collection('enseignants')
        .doc(enseignant.idEnseignant)
        .update(enseignant.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('enseignants').doc(id).delete();
  }
}



