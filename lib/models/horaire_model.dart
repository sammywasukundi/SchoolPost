//import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/firestore_service.dart';

class Horaire {
  String id = '';
  String etat = ''; //pre-programme ou A-programmer
  DateTime dateDebut = DateTime.now();
  DateTime dateFin = DateTime.now();
  String enseignant = '';
  String auditoire = '';
  String cours = '';


  Horaire();
  Horaire.withParam({
    required this.id,
    required this.etat,
    required this.dateDebut,
    required this.dateFin,
    required this.enseignant,
    required this.cours,

  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'etat': etat,
      'dateDebut': dateDebut,
      'dateFin': dateFin,
      'enseignant': enseignant,
      'cours': cours,
    };
  }

  factory Horaire.fromMap(Map<String, dynamic> map) {
    return Horaire.withParam(
      id: map['id'],
      etat: map['etat'],
      dateDebut: (map['dateDebut'] as Timestamp).toDate(),
      dateFin: (map['dateFin'] as Timestamp).toDate(),
      enseignant: map['enseignant'],
      cours: map['cours'],
    );
  }

  static const collection = 'horaires';
  Future<void> save() async {
    try {
      await FirestoreService.service.addOrUpdate(collection, toMap());
    } catch (e) {
      throw UnimplementedError();
    }
  }

  Future delete() async {
    try {
      await FirestoreService.service.delete(collection, id);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  static Future<List<Horaire>> fetchAll() async {
    try {
      final result = await FirestoreService.service.fetch(collection);
      return result.map((e) => Horaire.fromMap(e)).toList();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
