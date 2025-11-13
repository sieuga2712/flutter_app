import 'package:flutter/material.dart';
// Removed binding/controller usage for simplicity
import 'package:get/get.dart';

class Page2View extends StatefulWidget {
  const Page2View({super.key});

  @override
  State<Page2View> createState() => _Page2ViewState();
}

class _Page2ViewState extends State<Page2View> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    // No binding; dispose controller if needed in future
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.home, 'title': 'Trang chủ'},
      {'icon': Icons.favorite, 'title': 'Yêu thích'},
      {'icon': Icons.settings, 'title': 'Cài đặt'},
      {'icon': Icons.person, 'title': 'Tài khoản'},
      {'icon': Icons.notifications, 'title': 'Thông báo'},
      {'icon': Icons.map, 'title': 'Bản đồ'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lưới ô vuông có icon')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 ô mỗi hàng
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1, // hình vuông
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return InkWell(
              onTap: () {
                Get.toNamed('/page2_2', arguments: {
                  'icon': item['icon'],
                  'title': item['title'],
                });
              },
              borderRadius: BorderRadius.circular(16),
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Icon(
                        item['icon'],
                        size: 48,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ),
            );
          },
        ),
      ),
    );
  }
}
