import 'package:flutter/material.dart';
import 'package:appdautien/common/header_bar.dart';
import 'package:appdautien/common/router/main_router.dart';

class MainAppWithRouter extends StatefulWidget {
  const MainAppWithRouter({super.key});

  @override
  State<MainAppWithRouter> createState() => _MainAppWithRouterState();
}

class _MainAppWithRouterState extends State<MainAppWithRouter> {
  late MainRouter _router;

  @override
  void initState() {
    super.initState();
    _router = MainRouter();
    // Page bindings removed in cleanup
  }


  void _goBack() {
    setState(() {
      _router.goBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeConfig = _router.getCurrentRouteConfig();
    
    if (routeConfig == null) {
      return const Scaffold(
        body: Center(
          child: Text('Route not found'),
        ),
      );
    }

    return HeaderAppbar(
      title: routeConfig.title,
      isDrawer: routeConfig.showDrawer,
      pathScreen: _router.currentRoute,
      logoPath: routeConfig.logoPath,
      onBackButtonPressed: _router.canGoBack ? _goBack : null,
      onRouteChanged: () => setState(() {}),
      body: routeConfig.page,
    );
  }
}
