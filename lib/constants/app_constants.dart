import 'package:cloud_firestore/cloud_firestore.dart';


class Constants{
  Constants._();
  static const double padding = 2.0;
  static final dbInstance = FirebaseFirestore.instance.collection('equipes');
}

