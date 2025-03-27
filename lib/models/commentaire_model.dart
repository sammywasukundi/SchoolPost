import 'package:cloud_firestore/cloud_firestore.dart';

class Commentaire {
  String idComment;
  String idPublication;
  String Contenu;


  Commentaire({
    required this.idComment,
    required this.idPublication,
    required this.Contenu,
    
  });

  Commentaire.empty()
      : idComment = '',
        idPublication = '',
        Contenu = '';
        
        
  Map<String, dynamic> toMap() {
    return {
      'idComment': idComment,
      'idPublication': idPublication,
      'Contenu': Contenu,
      
    };
  }

  factory Commentaire.fromMap(Map<String, dynamic> map) {
    return Commentaire(
      idComment: map['idComment'],
      idPublication: map['idPublication'],
      Contenu: map['Contenu'],

    );
  }

  static Future<void> create(Commentaire commentaire) async {
    await FirebaseFirestore.instance
        .collection('commentaires')
        .doc(commentaire.idComment)
        .set(commentaire.toMap());
  }

  static Future<Commentaire?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('commentaires').doc(id).get();
    if (doc.exists) {
      return Commentaire.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Commentaire commentaire) async {
    await FirebaseFirestore.instance
        .collection('commentaires')
        .doc(commentaire.idComment)
        .update(commentaire.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('commentaires').doc(id).delete();
  }
}



