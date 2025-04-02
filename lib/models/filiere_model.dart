import 'package:cloud_firestore/cloud_firestore.dart';

class Filiere {
  String idFlre;
  String? idDomaine;
  String Libelle;

  Filiere({
    required this.idFlre,
    required this.idDomaine,
    required this.Libelle

  });

  Filiere.empty()
      : idFlre = '',
        idDomaine = '',
        Libelle = '';
        
  Map<String, dynamic> toMap() {
    return {
      'idFlre': idFlre,
      'idDomaine': idDomaine,
      'Libelle': Libelle,
      
    };
  }

  factory Filiere.fromMap(Map<String, dynamic> map) {
    return Filiere(
      idFlre: map['idFlre'],
      idDomaine: map['idDomaine'],
      Libelle: map['Libelle'],

    );
  }

  static Future<void> create(Filiere filiere) async {
    await FirebaseFirestore.instance
        .collection('filieres')
        .doc(filiere.idFlre)
        .set(filiere.toMap());
  }

  static Future<Filiere?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('filieres').doc(id).get();
    if (doc.exists) {
      return Filiere.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Filiere filiere) async {
    await FirebaseFirestore.instance
        .collection('filieres')
        .doc(filiere.idFlre)
        .update(filiere.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('filieres').doc(id).delete();
  }
}



