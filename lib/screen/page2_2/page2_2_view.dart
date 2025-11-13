import 'package:flutter/material.dart';
import 'package:appdautien/common/core/app_color.dart';
import 'package:get/get.dart';

class Page2_2View extends StatelessWidget {
  const Page2_2View({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final IconData selectedIcon = args?['icon'] as IconData? ?? Icons.info;
    final String selectedTitle = args?['title'] as String? ?? 'Chi tiết';
    return Scaffold(
      appBar: AppBar(title: Text(selectedTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(selectedIcon, size: 96, color: AppColor.blueAccentColor),
            const SizedBox(height: 12),
            Text(
              selectedTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
