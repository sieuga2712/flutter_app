import 'package:flutter/material.dart';

class Page3Controller extends ChangeNotifier {
  List<String> _todoList = [];
  String _newTodo = '';
  bool _isLoading = false;

  List<String> get todoList => _todoList;
  String get newTodo => _newTodo;
  bool get isLoading => _isLoading;

  void setNewTodo(String todo) {
    _newTodo = todo;
    notifyListeners();
  }

  void addTodo() {
    if (_newTodo.trim().isNotEmpty) {
      _todoList.add(_newTodo.trim());
      _newTodo = '';
      notifyListeners();
    }
  }

  void removeTodo(int index) {
    if (index >= 0 && index < _todoList.length) {
      _todoList.removeAt(index);
      notifyListeners();
    }
  }

  void toggleTodo(int index) {
    if (index >= 0 && index < _todoList.length) {
      // Simulate toggling by adding/removing a checkmark
      String todo = _todoList[index];
      if (todo.startsWith('✓ ')) {
        _todoList[index] = todo.substring(2);
      } else {
        _todoList[index] = '✓ $todo';
      }
      notifyListeners();
    }
  }

  void clearCompleted() {
    _todoList.removeWhere((todo) => todo.startsWith('✓ '));
    notifyListeners();
  }

  void clearAll() {
    _todoList.clear();
    notifyListeners();
  }

  void simulateLoading() {
    _isLoading = true;
    notifyListeners();
    
    Future.delayed(const Duration(seconds: 2), () {
      _isLoading = false;
      notifyListeners();
    });
  }
}
