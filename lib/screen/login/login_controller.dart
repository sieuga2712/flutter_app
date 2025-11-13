import 'package:flutter/material.dart';
import 'package:appdautien/common/auth_controller.dart';

class LoginController extends ChangeNotifier {
  final AuthController authController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  LoginController({AuthController? auth}) : authController = auth ?? AuthController() {
    usernameController.text = 'admin';
    passwordController.text = '123456';
  }

  @override
  void dispose() {
    authController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  String? validateUsername(String? value) {
    return authController.validateUsername(value);
  }

  String? validatePassword(String? value) {
    return authController.validatePassword(value);
  }

  void onUsernameChanged(String value) {
    authController.setUsername(value);
  }

  void onPasswordChanged(String value) {
    authController.setPassword(value);
  }

  Future<bool> submit() async {
    if (!(formKey.currentState?.validate() ?? false)) return false;
    authController.clearError();
    final success = await authController.login(
      usernameController.text.trim(),
      passwordController.text,
    );
    notifyListeners();
    return success;
  }
}


