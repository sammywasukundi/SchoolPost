import 'package:cloud_firestore/cloud_firestore.dart';

class Institution {
  String idInst;
  String Libelle;


  Institution({
    required this.idInst,
    required this.Libelle,
    
  });

  Institution.empty()
      : idInst = '',
        Libelle = '';
        
        
  Map<String, dynamic> toMap() {
    return {
      'idInst': idInst,
      'Libelle': Libelle,
      
    };
  }

  factory Institution.fromMap(Map<String, dynamic> map) {
    return Institution(
      idInst: map['idInst'],
      Libelle: map['Libelle'],

    );
  }

  static Future<void> create(Institution institution) async {
    await FirebaseFirestore.instance
        .collection('institutions')
        .doc(institution.idInst)
        .set(institution.toMap());
  }

  static Future<Institution?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('institutions').doc(id).get();
    if (doc.exists) {
      return Institution.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Institution institution) async {
    await FirebaseFirestore.instance
        .collection('institutions')
        .doc(institution.idInst)
        .update(institution.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('institutions').doc(id).delete();
  }
}



