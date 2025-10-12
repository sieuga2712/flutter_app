import 'package:flutter/material.dart';
import 'package:appdautien/common/core/app_color.dart';
import 'package:appdautien/screen/page1/page1_controller.dart';
import 'package:appdautien/screen/page1/page1_binding.dart';
import 'package:appdautien/common/bindings/binding_manager.dart';

class Page1View extends StatefulWidget {
  const Page1View({super.key});

  @override
  State<Page1View> createState() => _Page1ViewState();
}

class _Page1ViewState extends State<Page1View> {
  late Page1Controller _controller;
  late Page1Binding _binding;

  @override
  void initState() {
    super.initState();
    _binding = BindingManager().page1Binding!;
    _controller = _binding.page1Controller;
  }

  @override
  void dispose() {
    // Controller disposal is handled by binding
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.blueAccentColor,
                        AppColor.blueAccentColor.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 48,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Trang Cài Đặt',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Tùy chỉnh ứng dụng của bạn',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Color selection
                _buildSectionCard(
                  title: 'Chọn màu chủ đề',
                  icon: Icons.palette,
                  child: Column(
                    children: [
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: _controller.colorOptions.map((color) {
                          final isSelected = _controller.selectedColor == color;
                          return GestureDetector(
                            onTap: () => _controller.setSelectedColor(color),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? _controller.getColorFromName(color)
                                    : _controller.getColorFromName(color).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: _controller.getColorFromName(color),
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                color,
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black87,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _controller.getColorFromName(_controller.selectedColor).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: _controller.getColorFromName(_controller.selectedColor),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.color_lens,
                              color: _controller.getColorFromName(_controller.selectedColor),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Màu đã chọn: ${_controller.selectedColor}',
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Slider
                _buildSectionCard(
                  title: 'Điều chỉnh giá trị',
                  icon: Icons.tune,
                  child: Column(
                    children: [
                      Text(
                        'Giá trị: ${_controller.sliderValue.round()}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.blueAccentColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Slider(
                        value: _controller.sliderValue,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        activeColor: _controller.getColorFromName(_controller.selectedColor),
                        onChanged: _controller.setSliderValue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('0', style: TextStyle(color: Colors.grey[600])),
                          Text('100', style: TextStyle(color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Switch
                _buildSectionCard(
                  title: 'Cài đặt bật/tắt',
                  icon: Icons.toggle_on,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Chế độ nâng cao',
                        style: TextStyle(fontSize: 16),
                      ),
                      Switch(
                        value: _controller.switchValue,
                        onChanged: _controller.setSwitchValue,
                        activeColor: _controller.getColorFromName(_controller.selectedColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Date selection
                _buildSectionCard(
                  title: 'Chọn ngày',
                  icon: Icons.calendar_today,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: Text(
                          _controller.selectedDate,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          );
                          if (date != null) {
                            _controller.setSelectedDate(
                              '${date.day}/${date.month}/${date.year}',
                            );
                          }
                        },
                        icon: const Icon(Icons.calendar_month),
                        label: const Text('Chọn ngày'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _controller.getColorFromName(_controller.selectedColor),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Summary
                _buildSectionCard(
                  title: 'Tóm tắt cài đặt',
                  icon: Icons.summarize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSummaryItem('Màu chủ đề', _controller.selectedColor),
                      _buildSummaryItem('Giá trị slider', '${_controller.sliderValue.round()}'),
                      _buildSummaryItem('Chế độ nâng cao', _controller.switchValue ? 'Bật' : 'Tắt'),
                      _buildSummaryItem('Ngày đã chọn', _controller.selectedDate),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColor.blueAccentColor),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColor.blueAccentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
