//here I use the type final instead of string for the variable value
String? uValidator({
  required String? value,
  bool isRequired = false,
  bool isEmail = false,
  int? minLength,
  int? lengthMatri,
  String? match,
  DateTime? minDate,
}) {                                                   
  if (isRequired) {
    if (value == null || value.isEmpty) {
      return 'Champ obligatoire';
    }
  }

  if (isEmail) {
    if (!value!.contains('@') || !value.contains('.')) {
      return 'Email invalide';
    }
  }

  if (minLength != null) {
    if (value!.length < minLength) {
      return 'Aumoins $minLength caractères ';
    }
  }

  if (match != null) {
    
    if (value != match) {
      return 'mêmes mots de passes';
    }
                                                                                                                 
  }

  if (lengthMatri != null) {
    if (value!.length != 4) {
      return 'Tapez un matricule de 4 chiffres ';
    }
    
  }

  if (minDate != null) {
    if (DateTime.parse(value!).isBefore(minDate)) {
      return 'Date invalide';
    }
  }

  return null;
}


