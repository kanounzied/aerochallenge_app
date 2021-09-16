class Equipe{

  String name;
  List<dynamic> members;
  String chef;
  bool hasPlayed = false;
  Map<String, dynamic> historique;
  Equipe({this.name, this.members, this.chef});
  // Equipe({this.name, this.members, this.chef, this.hasPlayed});

  Equipe.fromMap(Map<String, dynamic> map)
    : name = map['name'],
      members = map['members'],
      chef = map['chef'],
      hasPlayed = map['hasPlayed'],
      historique = map['historique'];

}