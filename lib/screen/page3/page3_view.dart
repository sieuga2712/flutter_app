import 'package:flutter/material.dart';
import 'package:appdautien/common/core/app_color.dart';
import 'package:appdautien/screen/page3/page3_controller.dart';
import 'package:appdautien/screen/page3/page3_binding.dart';
import 'package:appdautien/common/bindings/binding_manager.dart';

class Page3View extends StatefulWidget {
  const Page3View({super.key});

  @override
  State<Page3View> createState() => _Page3ViewState();
}

class _Page3ViewState extends State<Page3View> {
  late Page3Controller _controller;
  late Page3Binding _binding;
  final TextEditingController _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _binding = BindingManager().page3Binding!;
    _controller = _binding.page3Controller;
  }

  @override
  void dispose() {
    _todoController.dispose();
    // Controller disposal is handled by binding
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.blueAccentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.blueAccentColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.checklist,
                        color: AppColor.blueAccentColor,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Danh sách công việc (${_controller.todoList.length})',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blueAccentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Add todo input
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: 'Nhập công việc mới...',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.add_task),
                        ),
                        onChanged: _controller.setNewTodo,
                        onSubmitted: (_) => _addTodo(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: _addTodo,
                      icon: const Icon(Icons.add),
                      label: const Text('Thêm'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blueAccentColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                
                // Loading indicator
                if (_controller.isLoading)
                  const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.blueAccentColor),
                    ),
                  ),
                
                // Todo list
                Expanded(
                  child: _controller.todoList.isEmpty
                      ? const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.inbox,
                                size: 64,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Chưa có công việc nào',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Thêm công việc đầu tiên của bạn!',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: _controller.todoList.length,
                          itemBuilder: (context, index) {
                            final todo = _controller.todoList[index];
                            final isCompleted = todo.startsWith('✓ ');
                            final displayText = isCompleted ? todo.substring(2) : todo;
                            
                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                leading: IconButton(
                                  onPressed: () => _controller.toggleTodo(index),
                                  icon: Icon(
                                    isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                                    color: isCompleted ? Colors.green : Colors.grey,
                                  ),
                                ),
                                title: Text(
                                  displayText,
                                  style: TextStyle(
                                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                                    color: isCompleted ? Colors.grey : null,
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () => _controller.removeTodo(index),
                                  icon: const Icon(Icons.delete, color: Colors.red),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                
                // Action buttons
                if (_controller.todoList.isNotEmpty) ...[
                  const SizedBox(height: 10),
                 Wrap(
  spacing: 8,       // Khoảng cách ngang giữa các nút
  runSpacing: 8,    // Khoảng cách dọc khi xuống dòng
  alignment: WrapAlignment.center,
  children: [
    ElevatedButton.icon(
      onPressed: _controller.clearCompleted,
      icon: const Icon(Icons.done_all),
      label: const Text('Xóa hoàn thành'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange[400],
        foregroundColor: Colors.white,
      ),
    ),
    ElevatedButton.icon(
      onPressed: _controller.simulateLoading,
      icon: const Icon(Icons.refresh),
      label: const Text('Tải lại'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
      ),
    ),
    ElevatedButton.icon(
      onPressed: _controller.clearAll,
      icon: const Icon(Icons.clear_all),
      label: const Text('Xóa tất cả'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
      ),
    ),
  ],
)
                ],
              ],
            ),
          );
        },
      );
  }

  void _addTodo() {
    if (_todoController.text.trim().isNotEmpty) {
      _controller.addTodo();
      _todoController.clear();
      FocusScope.of(context).unfocus();
    }
  }
}
