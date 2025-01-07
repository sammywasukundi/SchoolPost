class Etudiant {
  int? id;
  String nom;
  String pnom;
  int mention;
  String promotion;
  String matricule;
  String email;
  String pwd;

  Etudiant.empty()
      : id = null,
        nom = '',
        pnom = '',
        mention = 0,
        promotion = '',
        matricule = '',
        email = '',
        pwd = '';

  Etudiant({
    this.id,
    required this.nom,
    required this.pnom,
    required this.mention,
    required this.promotion,
    required this.matricule,
    required this.email,
    required this.pwd,
  });
  
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'pnom': pnom,
      'mention': mention,
      'matricule': matricule,
      'email': email,
      'pwd': pwd,
    };
  }
}