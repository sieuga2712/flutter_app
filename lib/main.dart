import 'package:appdautien/screen/login/login_view.dart';
import 'package:appdautien/screen/main_app/main_app_with_router.dart';
import 'package:appdautien/screen/page2_2/page2_2_view.dart';
import 'package:appdautien/screen/page2_2/page2_2_binding.dart';
import 'package:appdautien/common/bindings/binding_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Initialize binding manager
  BindingManager().initialize();
  
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/home', page: () => const MainAppWithRouter()),
        GetPage(name: '/page2_2', page: () => const Page2_2View(), binding: Page2_2Binding()),
      ],
    ),
  );
}


