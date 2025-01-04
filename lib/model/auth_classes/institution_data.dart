class InstitutionData {
  static const Map<String, List<String>> institutions = {
    "ISTA": ["Architecture", "Bâtiment"],
    "UNILUK": [
      "Sciences Économiques",
      "Sciences Informatiques",
      "Sciences Agronomiques",
      "Sciences de l'Éducation",
      "Sciencs théologiques"
    ],
    "ISTM": [
      "Sage-femme",
      "Soins Infirmiers",
      "Laboratoire",
      "Imagerie Médicale"
    ],
  };


  static const Map<String, List<String>> promotions = {
    "Architecture": ["L0", "L1", "L2", "L3"],
    "Bâtiment": ["L0", "L1", "L2", "L3"],
    "Sciences Informatiques": ["L1", "L2", "L3","L4"],
    "Sciences Économiques": ["L1", "L2", "L3", "M1", "M2"],
    "Sciences Agronomiques": ["L1", "L2", "L3", "M1", "M2"],
    "Sciences de l'Éducation": ["L1", "L2", "L3", "M1", "M2"],
    "Sciencs théologiques": ["L1", "L2", "L3"],
    "Sage-femme": ["L1", "L2", "L3", "M1", "M2"],
    "Soins Infirmiers": ["L1", "L2", "L3", "M1", "M2"],
    "Laboratoire": ["L1", "L2", "L3", "M1", "M2"],
    "Imagerie Médicale": ["L1", "L2", "L3", "M1", "M2"],
  };
}
