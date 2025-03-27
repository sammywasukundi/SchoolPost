import 'package:cloud_firestore/cloud_firestore.dart';

class TypePub {
  String idType;
  String Libelle;
  String Description;


  TypePub({
    required this.idType,
    required this.Libelle,
    required this.Description,
    
  });

  TypePub.empty()
      : idType = '',
        Libelle = '',
        Description = '';
        
        
  Map<String, dynamic> toMap() {
    return {
      'idType': idType,
      'Libelle': Libelle,
      'Description': Description,
      
    };
  }

  factory TypePub.fromMap(Map<String, dynamic> map) {
    return TypePub(
      idType: map['idType'],
      Libelle: map['Libelle'],
      Description: map['Description'],

    );
  }

  static Future<void> create(TypePub typePub) async {
    await FirebaseFirestore.instance
        .collection('typePubs')
        .doc(typePub.idType)
        .set(typePub.toMap());
  }

  static Future<TypePub?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('typePubs').doc(id).get();
    if (doc.exists) {
      return TypePub.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(TypePub typePub) async {
    await FirebaseFirestore.instance
        .collection('typePubs')
        .doc(typePub.idType)
        .update(typePub.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('typePubs').doc(id).delete();
  }
}



