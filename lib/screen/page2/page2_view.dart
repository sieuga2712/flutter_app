import 'package:flutter/material.dart';
import 'package:appdautien/common/core/app_color.dart';
import 'package:appdautien/screen/page2/page2_controller.dart';
import 'package:appdautien/screen/page2/page2_binding.dart';
import 'package:appdautien/common/bindings/binding_manager.dart';

class Page2View extends StatefulWidget {
  const Page2View({super.key});

  @override
  State<Page2View> createState() => _Page2ViewState();
}

class _Page2ViewState extends State<Page2View> {
  late Page2Controller _controller;
  late Page2Binding _binding;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _binding = BindingManager().page2Binding!;
    _controller = _binding.page2Controller;
  }

  @override
  void dispose() {
    _messageController.dispose();
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Message display
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColor.blueAccentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.blueAccentColor),
                  ),
                  child: Text(
                    _controller.message,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                // Counter display
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Counter:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${_controller.counter}',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blueAccentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Counter buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _controller.decrementCounter,
                      icon: const Icon(Icons.remove),
                      label: const Text('Giảm'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _controller.resetCounter,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[400],
                        foregroundColor: Colors.white,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _controller.incrementCounter,
                      icon: const Icon(Icons.add),
                      label: const Text('Tăng'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Message input
                const Text(
                  'Cập nhật tin nhắn:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Nhập tin nhắn mới...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      _controller.updateMessage(_messageController.text);
                      _messageController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Tin nhắn đã được cập nhật!'),
                          backgroundColor: AppColor.blueAccentColor,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.update),
                  label: const Text('Cập nhật tin nhắn'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.blueAccentColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          );
        },
      );
  }
}
