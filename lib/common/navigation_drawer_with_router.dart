import 'package:flutter/material.dart';
import 'package:appdautien/common/core/app_color.dart';
import 'package:appdautien/common/auth_controller.dart';
import 'package:appdautien/common/router/main_router.dart';

class AppNavigationDrawerWithRouter extends StatelessWidget {
  final AuthController? authController;
  final VoidCallback? onRouteChanged;
  
  const AppNavigationDrawerWithRouter({
    super.key, 
    this.authController,
    this.onRouteChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.blueAccentColor, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.apps,
                  size: 48,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'Flutter App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ứng dụng Flutter Demo',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          
          // Navigation items
          _buildNavigationItem(
            context,
            icon: Icons.home,
            title: 'Trang Chủ',
            route: '/home',
          ),
          _buildNavigationItem(
            context,
            icon: Icons.settings,
            title: 'Page 1 - Settings',
            route: '/page1',
          ),
          _buildNavigationItem(
            context,
            icon: Icons.add_circle,
            title: 'Page 2 - Counter',
            route: '/page2',
          ),
          _buildNavigationItem(
            context,
            icon: Icons.checklist,
            title: 'Page 3 - Todo List',
            route: '/page3',
          ),
          
          const Divider(),
          
          // About section
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.grey,
            ),
            title: const Text(
              'Về ứng dụng',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
          
          // Logout section (if authController is provided)
          if (authController != null) ...[
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Đăng xuất',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog(context);
              },
            ),
          ],
          
          // Binding info removed after cleanup
          
          // Router info section
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.route,
              color: Colors.grey,
            ),
            title: const Text(
              'Router Info',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            subtitle: Text(
              'Current route: ${MainRouter().currentRoute}',
              style: const TextStyle(fontSize: 10),
            ),
            onTap: () {
              Navigator.pop(context);
              _showRouterInfo(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
  }) {
    final router = MainRouter();
    final isCurrentRoute = router.currentRoute == route;
    
    return ListTile(
      leading: Icon(
        icon,
        color: isCurrentRoute ? AppColor.blueAccentColor : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isCurrentRoute ? FontWeight.bold : FontWeight.normal,
          color: isCurrentRoute ? AppColor.blueAccentColor : Colors.black87,
        ),
      ),
      selected: isCurrentRoute,
      selectedTileColor: AppColor.blueAccentColor.withOpacity(0.1),
      onTap: () {
        Navigator.pop(context);
        router.navigateTo(route);
        onRouteChanged?.call();
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Về ứng dụng'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flutter Demo App'),
            SizedBox(height: 10),
            Text('Phiên bản: 1.0.0'),
            SizedBox(height: 10),
            Text('Ứng dụng demo với router system:'),
            SizedBox(height: 5),
            Text('• Trang chủ'),
            Text('• Page 1: Trang cài đặt'),
            Text('• Page 2: Trang đếm số'),
            Text('• Page 3: Danh sách công việc'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Đăng xuất'),
        content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              authController?.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Đăng xuất'),
          ),
        ],
      ),
    );
  }

  // Binding info removed

  void _showRouterInfo(BuildContext context) {
    final router = MainRouter();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Router Information'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current route: ${router.currentRoute}'),
            const SizedBox(height: 10),
            Text('Can go back: ${router.canGoBack}'),
            const SizedBox(height: 10),
            const Text('Route history:'),
            ...router.routeHistory.map((route) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('• $route'),
            )),
            const SizedBox(height: 10),
            const Text('Available routes:'),
            ...router.allRoutes.keys.map((route) => Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('• $route'),
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}
