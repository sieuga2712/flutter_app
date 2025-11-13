import 'package:appdautien/screen/page2_2/page2_2_view.dart';
import 'package:flutter/material.dart';
import 'package:appdautien/screen/page1/page1_view.dart';
import 'package:appdautien/screen/page2/page2_view.dart';
import 'package:appdautien/screen/page3/page3_view.dart';
import 'package:appdautien/common/constants/app_constants.dart';

/// Main router with header_bar as root layout
/// Manages navigation state and route configurations
class MainRouter {
  static final MainRouter _instance = MainRouter._internal();
  factory MainRouter() => _instance;
  MainRouter._internal();


  /// Current route name
  String _currentRoute = AppConstants.routeHome;

  /// Route history for back navigation
  final List<String> _routeHistory = [AppConstants.routeHome];

  /// Route configurations
  static final Map<String, RouteConfig> _routes = {
    AppConstants.routeHome: RouteConfig(
      title: AppConstants.titleHome,
      page: const HomePage(),
      showDrawer: true,
      showBottomNav: true,
    ),
    AppConstants.routePage1: RouteConfig(
      title: AppConstants.titlePage1,
      page: const Page1View(),
      showDrawer: true,
      showBottomNav: true,
    ),
    AppConstants.routePage2: RouteConfig(
      title: AppConstants.titlePage2,
      page: const Page2View(),
      showDrawer: true,
      showBottomNav: true,
    ),
    AppConstants.routePage2_2: RouteConfig(
      title: AppConstants.titlePage2_2,
      page: const Page2_2View(),
      showDrawer: false,
      showBottomNav: true,
    ),
    AppConstants.routePage3: RouteConfig(
      title: AppConstants.titlePage3,
      page: const Page3View(),
      showDrawer: true,
      showBottomNav: true,
    ),
  };

  /// Get current route
  String get currentRoute => _currentRoute;

  /// Get route history
  List<String> get routeHistory => List.unmodifiable(_routeHistory);

  /// Check if can go back
  bool get canGoBack => _routeHistory.length > 1;

  /// Navigate to route with validation
  /// Returns true if navigation successful, false otherwise
  bool navigateTo(String route, {bool addToHistory = true}) {
    if (!_routes.containsKey(route)) {
      return false;
    }

    _currentRoute = route;
    if (addToHistory && _routeHistory.last != route) {
      _routeHistory.add(route);
    }
    return true;
  }

  /// Go back to previous route
  /// Returns true if back navigation successful, false otherwise
  bool goBack() {
    if (!canGoBack) {
      return false;
    }

    _routeHistory.removeLast();
    _currentRoute = _routeHistory.last;
    return true;
  }

  /// Get current route config
  RouteConfig? getCurrentRouteConfig() {
    return _routes[_currentRoute];
  }

  /// Get all available routes
  Map<String, RouteConfig> get allRoutes => Map.unmodifiable(_routes);

  /// Reset to home route
  void resetToHome() {
    _currentRoute = AppConstants.routeHome;
    _routeHistory.clear();
    _routeHistory.add(AppConstants.routeHome);
  }

  /// Check if route exists
  bool hasRoute(String route) {
    return _routes.containsKey(route);
  }

  /// Get route by index (for bottom navigation)
  String? getRouteByIndex(int index) {
    final routes = _routes.keys.toList();
    if (index >= 0 && index < routes.length) {
      return routes[index];
    }
    return null;
  }

  /// Get index of current route (for bottom navigation)
  int getCurrentRouteIndex() {
    final routes = _routes.keys.toList();
    return routes.indexOf(_currentRoute);
  }
}

/// Route configuration class
class RouteConfig {
  final String title;
  final Widget page;
  final bool showDrawer;
  final bool showBottomNav;
  final String? logoPath;
  final Function()? onBackButtonPressed;

  const RouteConfig({
    required this.title,
    required this.page,
    this.showDrawer = true,
    this.showBottomNav = true,
    this.logoPath,
    this.onBackButtonPressed,
  });
}

/// Home page widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 64, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            'Chào mừng đến với Flutter Demo App!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Sử dụng menu bên trái để điều hướng giữa các trang',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
