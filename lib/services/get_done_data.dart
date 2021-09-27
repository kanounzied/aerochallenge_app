

class DoneService{
  bool _helipadDone = false;
  bool _auschwitzDone = false;
  bool _missilesDone = false;
  bool _toriiDone = false;
  bool _wtcDone = false;
  bool _podiumDone = false;

  bool get helipadDone => _helipadDone;
  bool get auschwitzDone => _auschwitzDone;
  bool get missilesDone => _missilesDone;
  bool get toriiDone => _toriiDone;
  bool get wtcDone => _wtcDone;
  bool get podiumDone => _podiumDone;

  set helipadDone(bool v){ _helipadDone = v;}
  set auschwitzDone(bool v){ _auschwitzDone = v;}
  set missilesDone(bool v){ _missilesDone = v;}
  set toriiDone(bool v){ _toriiDone = v;}
  set wtcDone(bool v){ _wtcDone = v;}
  set podiumDone(bool v){ _podiumDone = v;}

  Map<String,bool> getDoneMap(){
    return {
      "helipad": _helipadDone,
      "auschwitz": _auschwitzDone,
      "missiles": _missilesDone,
      "torii": _toriiDone,
      "wtc": _wtcDone,
      "podium": _podiumDone
    };
  }

  
  
}