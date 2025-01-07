//here I use the type final instead of string for the variable value
String? uValidator({
  required final value,
  bool isRequired = false,
  bool isEmail = false,
  int? minLength,
  String? match,
}) {                                                   
  if (isRequired) {
    if (value.isEmpty) {
      return 'Champ obligatoire';
    }
  }

  if (isEmail) {
    if (!value.contains('@') || !value.contains('.')) {
      return 'Email invalide';
    }
  }

  if (minLength != null) {
    if (value.length < minLength) {
      return 'Aumoins $minLength caractères ';
    }
  }

  if (match != null) {
    
    if (value != match) {
      return 'mêmes mots de passes';
    }
                                                                                                                 
  }

  return null;
}