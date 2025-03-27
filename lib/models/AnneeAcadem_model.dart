import 'package:cloud_firestore/cloud_firestore.dart';

class AnneeAcadem {
  String idAnne;
  String Libelle;
  String DateDebut;
  String DateFin;

  AnneeAcadem({
    required this.idAnne,
    required this.Libelle,
    required this.DateDebut,
    required this.DateFin,
  });

  AnneeAcadem.empty()
      :idAnne = '',
        Libelle = '',
        DateDebut = '',
        DateFin = '';

  Map<String, dynamic> toMap() {
    return {
      'idAnne': idAnne,
      'Libelle': Libelle,
      'DateDebut': DateDebut,
      'DateFin': DateFin,
    };
  }

  factory AnneeAcadem.fromMap(Map<String, dynamic> map) {
    return AnneeAcadem(
      idAnne: map['idAnne'],
      Libelle: map['Libelle'],
      DateDebut: map['DateDebut'],
      DateFin: map['DateFin'],
    );
  }

  static Future<void> create(AnneeAcadem anneeAcadem) async {
    await FirebaseFirestore.instance
        .collection('anneeAcadems')
        .doc(anneeAcadem.idAnne)
        .set(anneeAcadem.toMap());
  }

  static Future<AnneeAcadem?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('anneeAcadems').doc(id).get();
    if (doc.exists) {
      return AnneeAcadem.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(AnneeAcadem anneeAcadem) async {
    await FirebaseFirestore.instance
        .collection('anneeAcadems')
        .doc(anneeAcadem.idAnne)
        .update(anneeAcadem.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('anneeAcadems').doc(id).delete();
  }
}



