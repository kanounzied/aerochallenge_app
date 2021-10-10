// JSON to Dart
import 'package:aerochallenge_app/models/action.dart';

class Equipe {
  String id;
  String name;
  String chef;
  bool hasPlayed = false;
  List<ActionHist> historique;
  int homologationScore = 0;

  Equipe({this.name, this.chef});

  Equipe.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map['name'],
        chef = map['chef'],
        hasPlayed = map['hasPlayed'],
        // historique = map['historique'],
        homologationScore = map["homologationScore"];
}
