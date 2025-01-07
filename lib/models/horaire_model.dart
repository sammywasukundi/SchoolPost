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
}
