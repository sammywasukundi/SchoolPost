class Personnel {
  int? id;
  String nom;
  String pnom;
  int faculte;
  String institution;
  String email;
  String fonction;
  String type;
  String pwd;

  Personnel.empty()
      : id = null,
        nom = '',
        pnom = '',
        faculte = 0,
        institution = '',
        fonction = '',
        email = '',
        type = '',
        pwd = '';

  Personnel(
      {this.id,
      required this.nom,
      required this.pnom,
      required this.faculte,
      required this.institution,
      required this.email,
      required this.fonction,
      required this.type,
      required this.pwd});

  Personnel.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        nom = item["nom"],
        pnom = item["pnom"],
        faculte = item["faculte"],
        institution = item["institution"],
        email = item["email"],
        fonction = item["fonction"],
        type = item["type"],
        pwd = item["pwd"];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'pnom': pnom,
      'faculte': faculte,
      'institution': institution,
      'email': email,
      'fonction': fonction,
      'type': type,
      'pwd': pwd,
    };
  }
}
