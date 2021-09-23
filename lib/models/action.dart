class ActionHist {
  String type; // sonction ou succes
  String time;
  int value;
  String obstacle;
  String desc = "";

  ActionHist({this.time, this.desc, this.obstacle, this.type, this.value});

  String toString() {
    return "type: " +
        this.type +
        "; time: " +
        this.time +
        "; value: " +
        this.value.toString() +
        "\n";
  }

  Map<String, dynamic> toMap(ActionHist action) {
    return {
      "type": type,
      "time": time,
      "value": value,
      "obstacle": obstacle,
      "desc": desc,
    };
  }
}
