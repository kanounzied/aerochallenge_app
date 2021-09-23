var obstacles = [
  {
    "name": "helipad",
    "sonctions": ["-3"],
    "success": 5
  },
  {
    "name": "WTC",
    "sonctions": ["-5", "-10"],
    "counter": 0,
    "success": [-5, 10, 25, 40]
  },
  {
    "name": "auschwitz",
    "sonctions": ["-5"],
    "success": {
      "niveau1": {"5": 25, "7": 40},
      "niveau2": {"5": 10, "7": 20},
    },
    "record": 0
  },
  {
    "name": "torii",
    "sonctions": ["-5"],
    "success": 20
  },
  {
    "name": "missiles",
    "sonctions": ["-5", "-10"],
    "success": {"2": 15, "3": 30}
  },
  {
    "name": "podium",
    "success": [0, 25, 10, 5]
  }
];

// List<Widget> obsWidgets = [
//   Helipad(),
//   WTC(),
//   Auschwitz(),
//   Torii(),
//   Missiles(),
//   Podium()
// ];
