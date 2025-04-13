class Superadmin {
  int? id;
  String nom;
  String pnom;
  String email;
  String pwd;
  int idInst;

  Superadmin({
    this.id,
    required this.nom,
    required this.pnom,
    required this.email,
    required this.pwd,
    required this.idInst,
  });
}


// class Institution {
//   int? id;
//   String nomInst;
//   String fileAvatar;

//   Institution({
//     this.id,
//     required this.nomInst,
//     required this.fileAvatar,
//   });

//   static fromMap(Map<String, dynamic> data) {}
// }


