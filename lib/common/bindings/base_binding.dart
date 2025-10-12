/// Base class for all bindings
/// Manages the lifecycle of dependencies and controllers
abstract class BaseBinding {
  /// Called when the binding is first created
  void onInit() {}

  /// Called when the binding is disposed
  void onDispose() {}

  /// Called when the binding dependencies are ready
  void onReady() {}

  /// Called when the binding is about to be destroyed
  void onClose() {}
}

/// Mixin for dependency injection
mixin DependencyInjection {
  final Map<Type, dynamic> _dependencies = {};

  /// Register a dependency
  void put<T>(T dependency) {
    _dependencies[T] = dependency;
  }

  /// Get a dependency
  T? find<T>() {
    return _dependencies[T] as T?;
  }

  /// Check if dependency exists
  bool isRegistered<T>() {
    return _dependencies.containsKey(T);
  }

  /// Remove a dependency
  void delete<T>() {
    _dependencies.remove(T);
  }

  /// Clear all dependencies
  void clear() {
    _dependencies.clear();
  }
}

/// Binding manager to handle multiple bindings
class BindingManager with DependencyInjection {
  final List<BaseBinding> _bindings = [];

  /// Add a binding
  void addBinding(BaseBinding binding) {
    _bindings.add(binding);
    binding.onInit();
  }

  /// Remove a binding
  void removeBinding(BaseBinding binding) {
    binding.onClose();
    _bindings.remove(binding);
  }

  /// Initialize all bindings
  void initialize() {
    for (final binding in _bindings) {
      binding.onReady();
    }
  }

  /// Dispose all bindings
  void dispose() {
    for (final binding in _bindings) {
      binding.onDispose();
    }
    clear();
  }
}
