class Course {
  final int id;
  final String depart;
  final String arrivee;
  final double distanceKm;
  final int prix;
  final int gainLivreur;
  final String statut;

  Course({
    required this.id,
    required this.depart,
    required this.arrivee,
    required this.distanceKm,
    required this.prix,
    required this.gainLivreur,
    required this.statut,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: int.parse(json["id"].toString()),
      depart: json["depart"],
      arrivee: json["arrivee"],
      distanceKm: double.parse(json["distance_km"].toString()),
      prix: int.parse(json["prix"].toString()),
      gainLivreur: int.parse(json["gain_livreur"].toString()),
      statut: json["statut"],
    );
  }
}
