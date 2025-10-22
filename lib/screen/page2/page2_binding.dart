import 'package:appdautien/common/bindings/base_binding.dart';
import 'package:appdautien/screen/page2/page2_controller.dart';

class Page2Binding extends BaseBinding {
  late Page2Controller _page2Controller;

  @override
  void onInit() {
    super.onInit();
    _page2Controller = Page2Controller();
  }

  @override
  void onReady() {
    super.onReady();
    // Initialize page-specific data if needed
    _initializePageData();
  }

  @override
  void onDispose() {
    super.onDispose();
    _page2Controller.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up any resources
    _cleanupResources();
  }

  /// Get the page2 controller instance
  Page2Controller get page2Controller => _page2Controller;

  /// Initialize page-specific data
  void _initializePageData() {
    // Set default welcome message
    _page2Controller.updateMessage("Chào mừng đến với Page 2!");
  }

  /// Clean up resources
  void _cleanupResources() {
    // Save any important data before disposing
    // For example, save counter state or message
  }

  /// Reset page to default state
  void resetPage() {
    _page2Controller.resetCounter();
    _page2Controller.updateMessage("Chào mừng đến với Page 2!");
  }

  /// Get current page state
  Map<String, dynamic> getPageState() {
    return {
      'counter': _page2Controller.counter,
      'message': _page2Controller.message,
    };
  }

  /// Restore page state
  void restorePageState(Map<String, dynamic> state) {
    if (state.containsKey('counter')) {
      // Note: We can't directly set counter, so we simulate it
      int targetCounter = state['counter'] as int;
      int currentCounter = _page2Controller.counter;
      
      if (targetCounter > currentCounter) {
        for (int i = currentCounter; i < targetCounter; i++) {
          _page2Controller.incrementCounter();
        }
      } else if (targetCounter < currentCounter) {
        for (int i = currentCounter; i > targetCounter; i--) {
          _page2Controller.decrementCounter();
        }
      }
    }
    if (state.containsKey('message')) {
      _page2Controller.updateMessage(state['message']);
    }
  }

  /// Increment counter with validation
  void incrementCounter() {
    _page2Controller.incrementCounter();
  }

  /// Decrement counter with validation
  void decrementCounter() {
    _page2Controller.decrementCounter();
  }

  /// Reset counter
  void resetCounter() {
    _page2Controller.resetCounter();
  }

  /// Update message with validation
  void updateMessage(String message) {
    if (message.trim().isNotEmpty) {
      _page2Controller.updateMessage(message.trim());
    }
  }
}

