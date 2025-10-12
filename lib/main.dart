import 'package:appdautien/screen/login/login_view.dart';
import 'package:appdautien/screen/main_app/main_app_with_router.dart';
import 'package:appdautien/common/bindings/binding_manager.dart';
import 'package:flutter/material.dart';

void main() {
  // Initialize binding manager
  BindingManager().initialize();
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginView(),
        '/home': (context) => const MainAppWithRouter(),
      },
    ),
  );
}


