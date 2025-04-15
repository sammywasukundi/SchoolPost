import 'package:cloud_firestore/cloud_firestore.dart';

class Domaine {
  String idDomne;
  String? idInstitution;
  String nomDomne;
  String nomInstitution;

  Domaine({
    required this.idDomne,
    required this.nomDomne,
    required this.idInstitution,
    required this.nomInstitution
  });

  Domaine.empty()
      : idDomne = '',
        nomDomne = '',
        idInstitution = '',
        nomInstitution = '';

  Map<String, dynamic> toMap() {
    return {
      'idDomne': idDomne,
      'nomDomne': nomDomne,
      'idInstitution': idInstitution,
      'nomInstitution': nomInstitution
      
    };
  }

  factory Domaine.fromMap(Map<String, dynamic> map) {
    return Domaine(
      idDomne: map['idDomne'],
      nomDomne: map['nomDomne'],
      idInstitution: map['idInst'],
      nomInstitution: map['nomInstitution'] ?? '',
     
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
