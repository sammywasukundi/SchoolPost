import 'package:cloud_firestore/cloud_firestore.dart';

class CompositeKey {
  final int IdIdentite;
  final String idAnneeAcademique;

  CompositeKey(this.IdIdentite, this.idAnneeAcademique);

  // Redéfinir hashCode et == pour garantir l'unicité
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompositeKey &&
          runtimeType == other.runtimeType &&
          IdIdentite == other.IdIdentite &&
          idAnneeAcademique == other.idAnneeAcademique;

  @override
  int get hashCode => Object.hash(IdIdentite,idAnneeAcademique);
}
class Etudiant {
  String idEtudiant;
  String IdIdentite;
  String IdPromotion;
  String idAnneeAcademique;
  String Matricule;
  int CompositeKey;
  
 


  Etudiant({
    required this.idEtudiant,
    required this.IdIdentite,
    required this.IdPromotion,
    required this.idAnneeAcademique,
    required this.Matricule,
    required this.CompositeKey,
  });

  Etudiant.empty()
      : idEtudiant = '',
        IdIdentite = '',
        IdPromotion = '',
        idAnneeAcademique = '',
        Matricule = '',
        CompositeKey = 0;
        
  Map<String, dynamic> toMap() {
    return {
      'idEtudiant': idEtudiant,
      'IdIdentite': IdIdentite,
      'IdPromotion': IdPromotion,
      'idAnneeAcademique': idAnneeAcademique,
      'Matricule': Matricule,
      'CompositeKey': CompositeKey,
    };
  }

  factory Etudiant.fromMap(Map<String, dynamic> map) {
    return Etudiant(
      idEtudiant: map['idEtudiant'],
      IdIdentite: map['IdIdentite'],
      IdPromotion: map['IdPromotion'],
      idAnneeAcademique: map['idAnneeAcademique'],
      Matricule: map['Matricule'],
      CompositeKey: map['CompositeKey'],

    );
  }

  static Future<void> create(Etudiant etudiant) async {
    await FirebaseFirestore.instance
        .collection('etudiants')
        .doc(etudiant.idEtudiant)
        .set(etudiant.toMap());
  }

  static Future<Etudiant?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('etudiants').doc(id).get();
    if (doc.exists) {
      return Etudiant.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Etudiant etudiant) async {
    await FirebaseFirestore.instance
        .collection('etudiants')
        .doc(etudiant.idEtudiant)
        .update(etudiant.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('etudiants').doc(id).delete();
  }
}