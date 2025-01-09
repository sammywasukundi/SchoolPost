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

  Etudiant.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        nom = item["nom"],
        pnom = item["pnom"],
        mention = item["mention"],
        promotion = item["promotion"],
        matricule = item["matricule"],
        email = item["email"],
        pwd = item["pwd"];

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
