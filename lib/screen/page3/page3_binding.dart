import 'package:appdautien/common/bindings/base_binding.dart';
import 'package:appdautien/screen/page3/page3_controller.dart';

class Page3Binding extends BaseBinding {
  late Page3Controller _page3Controller;

  @override
  void onInit() {
    super.onInit();
    _page3Controller = Page3Controller();
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
    _page3Controller.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up any resources
    _cleanupResources();
  }

  /// Get the page3 controller instance
  Page3Controller get page3Controller => _page3Controller;

  /// Initialize page-specific data
  void _initializePageData() {
    // Add some sample todos if the list is empty
    if (_page3Controller.todoList.isEmpty) {
      _addSampleTodos();
    }
  }

  /// Clean up resources
  void _cleanupResources() {
    // Save todo list to persistent storage if needed
    _saveTodoList();
  }

  /// Add sample todos for demonstration
  void _addSampleTodos() {
    _page3Controller.addTodo();
    _page3Controller.setNewTodo("Hoàn thành dự án Flutter");
    _page3Controller.addTodo();
    
    _page3Controller.setNewTodo("Học về State Management");
    _page3Controller.addTodo();
    
    _page3Controller.setNewTodo("Tạo UI đẹp cho ứng dụng");
    _page3Controller.addTodo();
  }

  /// Save todo list to storage
  void _saveTodoList() {
    // Implementation for saving to SharedPreferences or database
    // This is a placeholder for future implementation
  }


  /// Reset page to default state
  void resetPage() {
    _page3Controller.clearAll();
    _addSampleTodos();
  }

  /// Get current page state
  Map<String, dynamic> getPageState() {
    return {
      'todoList': _page3Controller.todoList,
      'newTodo': _page3Controller.newTodo,
      'isLoading': _page3Controller.isLoading,
    };
  }

  /// Restore page state
  void restorePageState(Map<String, dynamic> state) {
    if (state.containsKey('todoList')) {
      List<String> todoList = List<String>.from(state['todoList']);
      // Clear current list and restore
      _page3Controller.clearAll();
      for (String todo in todoList) {
        _page3Controller.setNewTodo(todo);
        _page3Controller.addTodo();
      }
    }
    if (state.containsKey('newTodo')) {
      _page3Controller.setNewTodo(state['newTodo']);
    }
  }

  /// Add todo with validation
  void addTodo(String todo) {
    if (todo.trim().isNotEmpty) {
      _page3Controller.setNewTodo(todo.trim());
      _page3Controller.addTodo();
    }
  }

  /// Remove todo by index
  void removeTodo(int index) {
    _page3Controller.removeTodo(index);
  }

  /// Toggle todo completion
  void toggleTodo(int index) {
    _page3Controller.toggleTodo(index);
  }

  /// Clear completed todos
  void clearCompleted() {
    _page3Controller.clearCompleted();
  }

  /// Clear all todos
  void clearAll() {
    _page3Controller.clearAll();
  }

  /// Simulate loading
  void simulateLoading() {
    _page3Controller.simulateLoading();
  }

  /// Get todo statistics
  Map<String, int> getTodoStatistics() {
    final todoList = _page3Controller.todoList;
    final total = todoList.length;
    final completed = todoList.where((todo) => todo.startsWith('✓ ')).length;
    final pending = total - completed;
    
    return {
      'total': total,
      'completed': completed,
      'pending': pending,
    };
  }
}
