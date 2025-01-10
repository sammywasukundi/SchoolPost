class Cours {
  int? id;
  String designation;
  String idMention;
  String promotion;

  Cours(
      {this.id,
      required this.designation,
      required this.idMention,
      required this.promotion});

    Cours.fromMap(Map<String, dynamic>item)
    : id=item["id"],
      designation=item["designation"], 
      idMention=item["idMention"],  
      promotion=item["promotion"];

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'designation': designation,
      'idMention': idMention,
      'promotion': promotion,
    };
  }
}