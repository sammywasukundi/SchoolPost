import 'package:cloud_firestore/cloud_firestore.dart';

class Publication {
  String idPublication;
  String Titre;
  String Contenu;
  String File;
  String idType;
  DateTime Date;
  DateTime DateDebut;
  DateTime DateFin;
  String idPortee;
  bool Archive;
  String Typecommentaire;


  Publication({
    required this.idPublication,
    required this.Titre,
    required this.Contenu,
    required this.File,
    required this.idType,
    required this.Date,
    required this.DateDebut,
    required this.DateFin,
    required this.idPortee,
    required this.Archive,
    required this.Typecommentaire,
  });

  Publication.empty()
      : idPublication = '',
        Titre = '',
        Contenu = '',
        File = '',
        idType = '',
        Date = DateTime.now(),
        DateDebut = DateTime.now(),
        DateFin = DateTime.now(),
        idPortee = '',
        Archive = false,
        Typecommentaire = '';
        

  Map<String, dynamic> toMap() {
    return {
      'idPublication': idPublication,
      'Titre': Titre,
      'Contenu': Contenu,
      'File': File,
      'idType': idType,
      'Date': Date,
      'DateDebut': DateDebut,
      'DateFin': idType,
      'idPortee': idPortee,
      'Archive': Archive,
      'Typecommentaire': Typecommentaire,
      
    };
  }

  factory Publication.fromMap(Map<String, dynamic> map) {
    return Publication(
      idPublication: map['idPublication'],
      Titre: map['Titre'],
      Contenu: map['Contenu'],
      File: map['File'],
      idType: map['idType'],
      Date: map['Date'],
      DateDebut: map['DateDebut'],
      DateFin: map['DateFin'],
      idPortee: map['idPortee'],
      Archive: map['Archivage'],
      Typecommentaire: map['Typecommentaire'],

    );
  }

  static Future<void> create(Publication publication) async {
    await FirebaseFirestore.instance
        .collection('publications')
        .doc(publication.idPublication)
        .set(publication.toMap());
  }

  static Future<Publication?> get(String id) async {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('publications').doc(id).get();
    if (doc.exists) {
      return Publication.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  static Future<void> update(Publication publication) async {
    await FirebaseFirestore.instance
        .collection('publications')
        .doc(publication.idPublication)
        .update(publication.toMap());
  }

  static Future<void> delete(String id) async {
    await FirebaseFirestore.instance.collection('publications').doc(id).delete();
  }
}