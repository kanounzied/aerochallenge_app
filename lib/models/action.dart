class Action {

  String type; // sonction ou succes
  String time;
  int value;
  String obstacle;
  String desc;

  Action({this.time, this.desc, this.obstacle, this.type, this.value});

  Map<String,dynamic> toMap(Action action){
    return {
      "type": type,
      "time": time,
      "value": value,
      "obstacle": obstacle,
      "desc": desc,
    };
  }
}