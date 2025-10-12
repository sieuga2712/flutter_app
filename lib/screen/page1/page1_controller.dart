import 'package:flutter/material.dart';

/// Page1Controller manages settings page state
class Page1Controller extends ChangeNotifier {
  String _selectedColor = 'Blue';
  double _sliderValue = 50.0;
  bool _switchValue = false;
  String _selectedDate = 'Chưa chọn ngày';
  
  // Color options for settings
  static const List<String> _colorOptions = [
    'Blue', 'Red', 'Green', 'Purple', 'Orange'
  ];

  // Getters
  String get selectedColor => _selectedColor;
  double get sliderValue => _sliderValue;
  bool get switchValue => _switchValue;
  String get selectedDate => _selectedDate;
  List<String> get colorOptions => List.unmodifiable(_colorOptions);

  /// Set selected color with validation
  void setSelectedColor(String color) {
    if (_colorOptions.contains(color) && color != _selectedColor) {
      _selectedColor = color;
      notifyListeners();
    }
  }

  /// Set slider value with validation
  void setSliderValue(double value) {
    if (value >= 0 && value <= 100 && value != _sliderValue) {
      _sliderValue = value;
      notifyListeners();
    }
  }

  /// Set switch value
  void setSwitchValue(bool value) {
    if (value != _switchValue) {
      _switchValue = value;
      notifyListeners();
    }
  }

  /// Set selected date
  void setSelectedDate(String date) {
    if (date != _selectedDate) {
      _selectedDate = date;
      notifyListeners();
    }
  }

  /// Get color from name with validation
  Color getColorFromName(String colorName) {
    switch (colorName) {
      case 'Blue':
        return Colors.blue;
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Purple':
        return Colors.purple;
      case 'Orange':
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  /// Reset all settings to default
  void resetToDefault() {
    _selectedColor = 'Blue';
    _sliderValue = 50.0;
    _switchValue = false;
    _selectedDate = 'Chưa chọn ngày';
    notifyListeners();
  }

  /// Get settings summary
  Map<String, dynamic> getSettingsSummary() {
    return {
      'selectedColor': _selectedColor,
      'sliderValue': _sliderValue,
      'switchValue': _switchValue,
      'selectedDate': _selectedDate,
    };
  }
}
