import 'package:cloud_firestore/cloud_firestore.dart';

class Promotion {
  String idProm;
  String? idFiliere;
  String Libelle;

  Promotion({
    required this.idProm,
    required this.idFiliere,
    required this.Libelle
  });

  Promotion.empty()
      : idProm = '',
        idFiliere = '',
        Libelle = '';
        
  Map<String, dynamic> toMap() {
    return {
      'idProm': idProm,
      'idFiliere': idFiliere,
      'Libelle': Libelle,
      
    };
  }

  factory Promotion.fromMap(Map<String, dynamic> map) {
    return Promotion(
      idProm: map['idProm'],
      idFiliere: map['idFiliere'],
      Libelle: map['Libelle'],

    );
  }

  static Future<void> create(Promotion promotion) async {
    await FirebaseFirestore.instance
        .collection('promotions')
        .doc(promotion.idProm)
        .set(promotion.toMap());
  }

  static Future<Promotion?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('promotions').doc(id).get();
    if (doc.exists) {
      return Promotion.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Promotion promotion ) async {
    await FirebaseFirestore.instance
        .collection('promotions')
        .doc(promotion.idProm)
        .update(promotion.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('promotions').doc(id).delete();
  }
}



