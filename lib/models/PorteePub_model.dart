import 'package:cloud_firestore/cloud_firestore.dart';

class Portee {
  String idPorte;
  String idInstitution;
  String idDomaine;
  String idPromotion;

  Portee({
    required this.idPorte,
    required this.idInstitution,
    required this.idDomaine,
    required this.idPromotion,
  });

  Portee.empty()
      : idPorte = '',
        idInstitution = '',
        idDomaine = '',
        idPromotion = '';

  Map<String, dynamic> toMap() {
    return {
      'idPorte': idPorte,
      'idInstitution': idInstitution,
      'idDomaine': idDomaine,
      'idPromotion': idPromotion,
    };
  }

  factory Portee.fromMap(Map<String, dynamic> map) {
    return Portee(
      idPorte: map['idEnseignant'],
      idInstitution: map['idIdentite'],
      idDomaine: map['idAnneeAcademique'],
      idPromotion: map['idDomaine'],
    );
  }

  static Future<void> create(Portee portee) async {
    await FirebaseFirestore.instance
        .collection('portees')
        .doc(portee.idPorte)
        .set(portee.toMap());
  }

  static Future<Portee?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('portees').doc(id).get();
    if (doc.exists) {
      return Portee.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Portee portee) async {
    await FirebaseFirestore.instance
        .collection('portees')
        .doc(portee.idPorte)
        .update(portee.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('portees').doc(id).delete();
  }
}



