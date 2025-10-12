import 'package:flutter/material.dart';
import 'package:appdautien/common/core/app_color.dart';
import 'package:appdautien/common/router/main_router.dart';
import 'package:appdautien/common/constants/app_constants.dart';

/// Bottom navigation bar with router integration
class NavigationBottom extends StatelessWidget {
  final VoidCallback? onRouteChanged;
  
  const NavigationBottom({super.key, this.onRouteChanged});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppColor.blueAccentColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _getCurrentIndex(),
      onTap: (index) => _onItemTapped(context, index),
      items: _getNavigationItems(),
    );
  }

  /// Get current navigation index
  int _getCurrentIndex() {
    final router = MainRouter();
    return router.getCurrentRouteIndex();
  }

  /// Handle navigation item tap
  void _onItemTapped(BuildContext context, int index) {
    final router = MainRouter();
    final route = router.getRouteByIndex(index);
    
    if (route != null && router.navigateTo(route)) {
      onRouteChanged?.call();
    }
  }

  /// Get navigation items configuration
  List<BottomNavigationBarItem> _getNavigationItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle),
        label: 'Counter',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.checklist),
        label: 'Todo',
      ),
    ];
  }
}