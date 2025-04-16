import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signup({
    required String name,
    required String postname,
    required String email,
    required String password,
    required String matricule,
    required String promotion,
    required String role,
    required String anneeAcademique,
    String? imageUrl,
    String? field,
  }) async {
    try {
      // Création du compte utilisateur
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      String uid = userCredential.user!.uid;

      // 1. Création de l'identité
      await _firestore.collection('identite').doc(uid).set({
        'uid': uid,
        'name': name.trim(),
        'postname': postname.trim(),
        'email': email.trim(),
        'role': role,
        'imageUrl': imageUrl,
      });

      // 2. Enregistrement spécifique selon le rôle
      if (role == 'Etudiant') {
        await _firestore.collection('etudiants').doc(uid).set({
          'IdIdentite': uid,
          'IdPromotion': promotion,
          'idAnneeAcademique': anneeAcademique,
          'Matricule': matricule.trim(),
        });
      } else if (role == 'Enseignant') {
        await _firestore.collection('enseignants').doc(uid).set({
          'idIdentite': uid,
          'idAnneeAcademique': anneeAcademique,
          'idDomaine': field,
        });
      }

      return null; // Succès
    } catch (e) {
      return e.toString(); // Gestion d’erreur
    }
  }

  // Function to handle user login
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in the user using Firebase Authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Fetch the user's role from Firestore to determine access level
      DocumentSnapshot userDoc = await _firestore
          .collection('identite')
          .doc(userCredential.user!.uid)
          .get();

      return userDoc['role']; // Return the user's role (Admin/User)
    } catch (e) {
      return e.toString(); // Error: return the exception message
    }
  }

  // for user log out
  signOut() async {
    _auth.signOut();
  }
}
