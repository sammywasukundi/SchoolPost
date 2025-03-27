import 'package:cloud_firestore/cloud_firestore.dart';

class Identite {
  String idIdentite;
  String nom;
  String postNom;
  String email;
  String motDePasse;
  String photo;

  Identite({
    required this.idIdentite,
    required this.nom,
    required this.postNom,
    required this.email,
    required this.motDePasse,
    required this.photo,
  });

  Identite.empty()
      : idIdentite = '',
        nom = '',
        postNom = '',
        email = '',
        motDePasse = '',
        photo = '';

  Map<String, dynamic> toMap() {
    return {
      'idIdentite': idIdentite,
      'nom': nom,
      'postNom': postNom,
      'email': email,
      'motDePasse': motDePasse,
      'photo': photo,
    };
  }

  factory Identite.fromMap(Map<String, dynamic> map) {
    return Identite(
      idIdentite: map['idIdentite'],
      nom: map['nom'],
      postNom: map['postNom'],
      email: map['email'],
      motDePasse: map['motDePasse'],
      photo: map['photo'],
    );
  }

  static Future<void> create(Identite identite) async {
    await FirebaseFirestore.instance
        .collection('identites')
        .doc(identite.idIdentite)
        .set(identite.toMap());
  }

  static Future<Identite?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('identites').doc(id).get();
    if (doc.exists) {
      return Identite.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Identite identite) async {
    await FirebaseFirestore.instance
        .collection('identites')
        .doc(identite.idIdentite)
        .update(identite.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('identites').doc(id).delete();
  }
}