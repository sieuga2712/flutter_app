import 'package:flutter/material.dart';

class Page2_2Controller {
  Page2_2Controller();

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.camera_alt, 'title': 'Camera'},
    {'icon': Icons.photo, 'title': 'Thư viện'},
    {'icon': Icons.chat, 'title': 'Tin nhắn'},
    {'icon': Icons.call, 'title': 'Gọi'},
    {'icon': Icons.share, 'title': 'Chia sẻ'},
    {'icon': Icons.info, 'title': 'Thông tin'},
  ];

  void showNoteBottomSheet(
    BuildContext context,
    int index,
    TextEditingController messageController,
  ) {
    final item = items[index];
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: 'Ghi chú',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        final text = messageController.text.trim();
                        if (text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Ghi chú cho "${item['title']}": $text',
                              ),
                            ),
                          );
                          messageController.clear();
                        }
                      },
                      child: const Text('Lưu'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void dispose() {
    // Nếu cần dọn dẹp tài nguyên nội bộ, thực hiện ở đây.
  }
}
