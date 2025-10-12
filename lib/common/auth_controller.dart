import 'package:flutter/material.dart';
import 'package:appdautien/common/constants/app_constants.dart';

/// Authentication controller with improved error handling and validation
class AuthController extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = '';
  bool _isLoading = false;
  String _errorMessage = '';

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    // Password is only used for validation, not stored
    notifyListeners();
  }

  /// Login with username and password
  /// Returns true if successful, false otherwise
  Future<bool> login(String username, String password) async {
    try {
      _setLoading(true);
      _clearError();

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      // Validate credentials
      if (_validateCredentials(username, password)) {
        _setLoggedIn(true, username);
        return true;
      } else {
        _setError(ValidationMessages.invalidCredentials);
        return false;
      }
    } catch (e) {
      _setError(ErrorMessages.loginFailed);
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// Logout user and clear session
  void logout() {
    _isLoggedIn = false;
    _username = '';
    _errorMessage = '';
    notifyListeners();
  }

  /// Clear error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  // Private helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  void _setLoggedIn(bool loggedIn, String username) {
    _isLoggedIn = loggedIn;
    _username = username;
    notifyListeners();
  }

  bool _validateCredentials(String username, String password) {
    return username == AppConstants.demoUsername && 
           password == AppConstants.demoPassword;
  }

  // Validation methods
  bool isValidUsername(String username) {
    return username.length >= AppConstants.minUsernameLength;
  }

  bool isValidPassword(String password) {
    return password.length >= AppConstants.minPasswordLength;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.usernameRequired;
    }
    if (value.length < AppConstants.minUsernameLength) {
      return ValidationMessages.usernameTooShort;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.passwordRequired;
    }
    if (value.length < AppConstants.minPasswordLength) {
      return ValidationMessages.passwordTooShort;
    }
    return null;
  }
}
