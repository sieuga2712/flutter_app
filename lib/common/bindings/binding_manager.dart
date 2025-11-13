// Binding system removed to tối giản code UI

/// Main binding manager for the entire application
class BindingManager {
  static final BindingManager _instance = BindingManager._internal();
  factory BindingManager() => _instance;
  BindingManager._internal();

  void initialize() {}
  bool get isAuthenticated => false;
  String get currentUsername => '';
  void dispose() {}
  void disposePageBindings() {}
  void resetAllPages() {}
  Map<String, Map<String, dynamic>> getAllPageStates() => {};
  void restoreAllPageStates(Map<String, Map<String, dynamic>> states) {}
  bool hasBinding(String key) => false;
  List<String> getAllBindingKeys() => const [];
  int get bindingCount => 0;
}
