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

  Communique.fromMap(Map<String, dynamic> item)
      : id = item["id"],
        titreCmq = item["titreCmq"],
        contenu = item["contenu"],
        avatar = item["avatar"],
        service = item["service"],
        type = item["type"],
        concerne = item["concerne"],
        savedAt = item["savedAt"],
        updatedAt = item["updatedAt"];
      
    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titreCmq': titreCmq,
      'contenu': contenu,
      'avatar': avatar,
      'service': service,
      'type': type,
      'concerne': concerne,
      'savedAt': savedAt,
      'updatedAt': updatedAt,
     
    };
  }
}
