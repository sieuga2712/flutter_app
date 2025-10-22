import 'package:appdautien/common/bindings/base_binding.dart';
import 'package:appdautien/common/bindings/auth_binding.dart';
import 'package:appdautien/screen/page1/page1_binding.dart';
import 'package:appdautien/screen/page2/page2_binding.dart';
import 'package:appdautien/screen/page3/page3_binding.dart';

/// Main binding manager for the entire application
class BindingManager {
  static final BindingManager _instance = BindingManager._internal();
  factory BindingManager() => _instance;
  BindingManager._internal();

  final Map<String, BaseBinding> _bindings = {};
  bool _isInitialized = false;

  /// Initialize all bindings
  void initialize() {
    if (_isInitialized) return;

    // Initialize auth binding first (global)
    _bindings['auth'] = AuthBinding();
    _bindings['auth']!.onInit();
    _bindings['auth']!.onReady();

    _isInitialized = true;
  }

  /// Get a specific binding
  T? getBinding<T extends BaseBinding>(String key) {
    return _bindings[key] as T?;
  }

  /// Register a binding
  void registerBinding(String key, BaseBinding binding) {
    _bindings[key] = binding;
    binding.onInit();
    binding.onReady();
  }

  /// Unregister a binding
  void unregisterBinding(String key) {
    final binding = _bindings[key];
    if (binding != null) {
      binding.onDispose();
      binding.onClose();
      _bindings.remove(key);
    }
  }

  /// Initialize page-specific bindings
  void initializePageBindings() {
    // Page1 binding
    if (!_bindings.containsKey('page1')) {
      registerBinding('page1', Page1Binding());
    }

    // Page2 binding
    if (!_bindings.containsKey('page2')) {
      registerBinding('page2', Page2Binding());
    }

    // Page3 binding
    if (!_bindings.containsKey('page3')) {
      registerBinding('page3', Page3Binding());
    }
  }

  /// Get auth binding
  AuthBinding? get authBinding => getBinding<AuthBinding>('auth');

  /// Get page1 binding
  Page1Binding? get page1Binding => getBinding<Page1Binding>('page1');

  /// Get page2 binding
  Page2Binding? get page2Binding => getBinding<Page2Binding>('page2');

  /// Get page3 binding
  Page3Binding? get page3Binding => getBinding<Page3Binding>('page3');

  /// Check if user is authenticated
  bool get isAuthenticated {
    final auth = authBinding;
    return auth?.isLoggedIn ?? false;
  }

  /// Get current username
  String get currentUsername {
    final auth = authBinding;
    return auth?.currentUsername ?? '';
  }

  /// Dispose all bindings
  void dispose() {
    for (final binding in _bindings.values) {
      binding.onDispose();
      binding.onClose();
    }
    _bindings.clear();
    _isInitialized = false;
  }

  /// Dispose specific page bindings (keep auth)
  void disposePageBindings() {
    final pageKeys = ['page1', 'page2', 'page3'];
    for (final key in pageKeys) {
      unregisterBinding(key);
    }
  }

  /// Reset all page states
  void resetAllPages() {
    page1Binding?.resetPage();
    page2Binding?.resetPage();
    page3Binding?.resetPage();
  }

  /// Get all page states
  Map<String, Map<String, dynamic>> getAllPageStates() {
    return {
      'page1': page1Binding?.getPageState() ?? {},
      'page2': page2Binding?.getPageState() ?? {},
      'page3': page3Binding?.getPageState() ?? {},
    };
  }

  /// Restore all page states
  void restoreAllPageStates(Map<String, Map<String, dynamic>> states) {
    if (states.containsKey('page1')) {
      page1Binding?.restorePageState(states['page1']!);
    }
    if (states.containsKey('page2')) {
      page2Binding?.restorePageState(states['page2']!);
    }
    if (states.containsKey('page3')) {
      page3Binding?.restorePageState(states['page3']!);
    }
  }

  /// Check if binding exists
  bool hasBinding(String key) {
    return _bindings.containsKey(key);
  }

  /// Get all binding keys
  List<String> getAllBindingKeys() {
    return _bindings.keys.toList();
  }

  /// Get binding count
  int get bindingCount => _bindings.length;
}

