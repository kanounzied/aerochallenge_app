import 'package:cloud_firestore/cloud_firestore.dart';


class Constants{
  Constants._();
  static const double padding = 2.0;
  static const double avatarRadius = 4.5;
  static final dbInstance = FirebaseFirestore.instance.collection('equipes');
}

