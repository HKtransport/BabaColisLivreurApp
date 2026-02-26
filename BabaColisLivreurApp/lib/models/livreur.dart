class Livreur {
  final int id;
  final String nom;
  final String telephone;
  final int solde;
  final String statut;

  Livreur({
    required this.id,
    required this.nom,
    required this.telephone,
    required this.solde,
    required this.statut,
  });

  factory Livreur.fromJson(Map<String, dynamic> json) {
    return Livreur(
      id: int.parse(json["id"].toString()),
      nom: json["nom"],
      telephone: json["telephone"],
      solde: int.parse(json["solde"].toString()),
      statut: json["statut"],
    );
  }
}
