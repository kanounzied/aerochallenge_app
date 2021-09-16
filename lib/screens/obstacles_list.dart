// import 'package:aerochallenge_app/config/responsive_size.dart';
// import 'package:aerochallenge_app/config/theme.dart';
import 'package:aerochallenge_app/models/equipe.dart';
import 'package:flutter/material.dart';

class ObstaclesList extends StatefulWidget {
  const ObstaclesList({ Key key , @required this.equipe}) : super(key: key);
  
  final Equipe equipe;

  @override
  _ObstaclesListState createState() => _ObstaclesListState();
}

class _ObstaclesListState extends State<ObstaclesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('liste obstacles'),),
    );
  }
}