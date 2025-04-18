import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:school_post/theme/app_colors.dart';

class ProfileButton extends StatelessWidget {
  final Color iconColor;
  final VoidCallback onPressed;

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    List<Map<String, dynamic>> users = [];

    final snapshot =
        await FirebaseFirestore.instance.collection('identite').get();

    for (var doc in snapshot.docs) {
      final data = doc.data();
      final String role = data['role'];

      Map<String, dynamic> userData = {
        'uid': doc.id,
        'name': data['name'],
        'postname': data['postname'],
        'email': data['email'],
        'institution': data['institution'],
        'role': role,
        'imageUrl': data['imageUrl'],
      };

      if (role == 'etudiant') {
        final etuDoc = await FirebaseFirestore.instance
            .collection('etudiants')
            .doc(doc.id)
            .get();
        if (etuDoc.exists) {
          userData.addAll(etuDoc.data()!);
        }
      } else if (role == 'enseignant') {
        final ensDoc = await FirebaseFirestore.instance
            .collection('enseignants')
            .doc(doc.id)
            .get();
        if (ensDoc.exists) {
          userData.addAll(ensDoc.data()!);
        }
      }

      users.add(userData);
    }

    return users;
  }

  const ProfileButton({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return IconButton(
            icon: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: blueColor,
                strokeWidth: 2.0,
              ),
            ),
            color: iconColor,
            onPressed: null,
          );
        } else if (snapshot.hasError) {
          return IconButton(
            icon: const Icon(Icons.error),
            color: iconColor,
            onPressed: null,
          );
        } else {
          final users = snapshot.data ?? [];
          final userImageUrl = users.isNotEmpty ? users[0]['imageUrl'] : null;

          return IconButton(
            icon: userImageUrl != null && userImageUrl.isNotEmpty
                ? CircleAvatar(
                    backgroundImage: NetworkImage(userImageUrl),
                  )
                : const Icon(Icons.account_circle_outlined),
            color: iconColor,
            onPressed: onPressed,
          );
        }
      },
    );
  }
}
