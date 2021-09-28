import 'package:flutter/cupertino.dart';

class CounterBloc extends ChangeNotifier {
  int _count = 0;

  get count => _count;

  void increment() {
    if (_count < 3) _count++;
    notifyListeners();
  }

  void decrement() {
    if (_count > 0) _count--;
    notifyListeners();
  }

  void reset(){
    _count = 0;
  }
}
