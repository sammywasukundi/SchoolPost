import 'package:cloud_firestore/cloud_firestore.dart';

class Domaine {
  String idDomne;
  String Libelle;
  String idInstitution;

  Domaine({
    required this.idDomne,
    required this.Libelle,
    required this.idInstitution,
  });

  Domaine.empty()
      : idDomne = '',
        Libelle = '',
        idInstitution = '';

  Map<String, dynamic> toMap() {
    return {
      'idDomne': idDomne,
      'idInstitution': idInstitution,
      'Libelle': Libelle
    };
  }

  factory Domaine.fromMap(Map<String, dynamic> map) {
    return Domaine(
      idDomne: map['idFlre'],
      idInstitution: map['idDomaine'],
      Libelle: map['Libelle'],
    );
  }

  static Future<void> create(Domaine domaine) async {
    await FirebaseFirestore.instance
        .collection('domaines')
        .doc(domaine.idDomne)
        .set(domaine.toMap());
  }

  static Future<Domaine?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('domaines').doc(id).get();
    if (doc.exists) {
      return Domaine.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Domaine domaine) async {
    await FirebaseFirestore.instance
        .collection('domaines')
        .doc(domaine.idDomne)
        .update(domaine.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('domaines').doc(id).delete();
  }
}
