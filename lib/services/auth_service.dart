import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to handle user signup
  Future<String?> signup({
    required String name,
    required String postname,
    required String email,
    required String password,
    required String institution,
    required String matricule,
    required String promotion,
    required String role,
    String? imageUrl,
    String? field,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      String uid = userCredential.user!.uid;

      // Save additional user data (name, role) in Firestore
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'name': name.trim(),
        'postname': postname.trim(),
        'institution': institution.trim(),
        'matricule': matricule.trim(),
        'promotion': promotion.trim(),
        'field': field?.trim(),
        //'imageUrl': imageUrl,
        'email': email.trim(),
        'role': role, // Admin or User
      });

      return null; 
    } catch (e) {
      return e.toString(); 
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
          .collection('users')
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
