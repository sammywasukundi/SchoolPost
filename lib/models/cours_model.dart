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
   
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'designation': designation,
      'idMention': idMention,
      'promotion': promotion,
    };
  }
}