class Communique {
  int? id;
  String titreCmq;
  String contenu;
  String avatar;
  String service;
  String type; //
  String concerne;
  DateTime savedAt;
  DateTime updatedAt;

  Communique.empty()
      : id = null,
        titreCmq = '',
        contenu = '',
        avatar = '',
        service = '',
        type = '',
        concerne = '',
        savedAt = DateTime(0),
        updatedAt = DateTime(0);

  Communique({
    this.id,
    required this.titreCmq,
    required this.contenu,
    required this.avatar,
    required this.service,
    required this.type,
    required this.concerne,
    required this.savedAt,
    required this.updatedAt,
  });
}
