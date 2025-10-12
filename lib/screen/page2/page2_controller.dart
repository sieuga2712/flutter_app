import 'package:flutter/material.dart';

class Page2Controller extends ChangeNotifier {
  int _counter = 0;
  String _message = "Chào mừng đến với Page 2!";

  int get counter => _counter;
  String get message => _message;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
