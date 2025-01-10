class Horaire {
  int? id;
  String etat; //pre-programme ou A-programmer
  DateTime dateDebut;
  DateTime dateFin;
  String enseignant;
  String auditoire;
  int cours;
  String type; //examen-Cours
  String fichier;
  DateTime savedAt;
  DateTime updatedAt;

  Horaire({
    this.id,
    required this.etat,
    required this.dateDebut,
    required this.dateFin,
    required this.enseignant,
    required this.auditoire,
    required this.cours,
    required this.type,
    required this.fichier,
    required this.savedAt,
    required this.updatedAt,
  });
  Horaire.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        etat = item["etat"],
        dateDebut = item["dateDebut"],
        dateFin = item["dateFin"],
        enseignant = item["enseignant"],
        auditoire = item["auditoire"],
        cours = item["cours"],
        type = item["type"],
        fichier = item["fichier"],
        savedAt = item["savedAt"],
        updatedAt = item["updatedAt"];

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'etat': etat,
      'dateDebut': dateDebut,
      'enseignant': enseignant,
      'auditoire': auditoire,
      'cours': cours,
      'type': type,
      'fichier': fichier,
      'savedAt': savedAt,
      'updatedAt': updatedAt
    };
    }
}
