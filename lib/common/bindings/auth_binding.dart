import 'package:appdautien/common/bindings/base_binding.dart';
import 'package:appdautien/common/auth_controller.dart';

class AuthBinding extends BaseBinding {
  late AuthController _authController;

  @override
  void onInit() {
    super.onInit();
    _authController = AuthController();
  }

  @override
  void onReady() {
    super.onReady();
    // Any additional setup after controller is created
  }

  @override
  void onDispose() {
    super.onDispose();
    _authController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    _authController.logout();
  }

  /// Get the auth controller instance
  AuthController get authController => _authController;

  /// Check if user is logged in
  bool get isLoggedIn => _authController.isLoggedIn;

  /// Get current username
  String get currentUsername => _authController.username;
}

