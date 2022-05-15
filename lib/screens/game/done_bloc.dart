import 'package:flutter/material.dart';

class DoneBloc extends ChangeNotifier {
  bool _helipad;
  bool _wtc;
  bool _auschwitz;
  bool _torii;
  bool _missiles;
  bool _podium;

  @override
  DoneBloc() {
    _helipad = false;
    _wtc = false;
    _auschwitz = false;
    _torii = false;
    _missiles = false;
    _podium = false;
  }

  bool get helipad => _helipad;
  bool get wtc => _wtc;
  bool get auschwitz => _auschwitz;
  bool get torii => _torii;
  bool get missiles => _missiles;
  bool get podium => _podium;

  void updateHeli(bool val) {
    _helipad = val;
    notifyListeners();
  }

  void updateWTC(bool val) {
    _wtc = val;
    notifyListeners();
  }

  void updateAuschwitz(bool val) {
    _auschwitz = val;
    notifyListeners();
  }

  void updateTorii(bool val) {
    _torii = val;
    notifyListeners();
  }

  void updateMissiles(bool val) {
    _missiles = val;
    notifyListeners();
  }

  void updatePodium(bool val) {
    _podium = val;
    notifyListeners();
  }

  void reinitialize() {
    _helipad = false;
    _wtc = false;
    _auschwitz = false;
    _torii = false;
    _missiles = false;
    _podium = false;
    // notifyListeners();
  }
}
