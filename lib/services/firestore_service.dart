import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/horaire_model.dart';

class FirestoreService {
  FirestoreService();

  static FirestoreService get service => FirestoreService();

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  Future<void> addHoraire(Horaire horaire) async {
    try {
      await FirebaseFirestore.instance.collection('horaires').add(horaire.toMap());
    } catch (e) {
      print('Error adding horaire: $e');
    }
  }
  
  Future<bool> addOrUpdate(String collection, Map<String, dynamic> data) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('USER NOT CONNECTED');
      return false;
    }
    try {
      data['users'] = user.uid;
      await instance.collection(collection).doc(data['id']).set(data);
      return true;
    } on FirebaseException catch (e) {
      print('ECHEC D ENREGRIGREMENT $collection - ${e.message}');
      return false;
    }
  }

  Future<bool> delete(String collection, String id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('USER NOT CONNECTED');
      return false;
    }
    try {
      await instance.collection(collection).doc(id).delete();
      return true;
    } on FirebaseException catch (e) {
      print('ECHEC De suppression $collection - ${e.message}');
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> fetch(String collection) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('USER NOT CONNECTED');
      return [];
    }
    try {
      final result = await instance
          .collection(collection)
          .where('users', isEqualTo: user.uid)
          .get();
      return result.docs.map((e) => e.data()).toList();
    } on FirebaseException catch (e) {
      print('ECHEC DE RECUPERATION $collection - ${e.message}');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getById(String collection, String id) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print('USER NOT CONNECTED');
      return null;
    }
    try {
      final doc = await instance.collection(collection).doc(id).get();
      return doc.exists ? doc.data() : null;
    } on FirebaseException catch (e) {
      print('ECHEC DE RECUPERATION $collection - ${e.message}');
      return null;
    }
  }
}