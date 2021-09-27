// JSON to Dart
class Equipe {
  String id;
  String name;
  List<dynamic> members;
  String chef;
  bool hasPlayed = false;
  List<dynamic> historique;

  Equipe({this.name, this.members, this.chef});

  // Equipe({this.name, this.members, this.chef, this.hasPlayed});

  Equipe.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map['name'],
        members = map['members'],
        chef = map['chef'],
        hasPlayed = map['hasPlayed'],
        historique = map['historique'];
}
