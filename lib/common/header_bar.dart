import 'package:appdautien/common/core/app_color.dart';
import 'package:appdautien/common/core/app_string.dart';
import 'package:appdautien/common/navigation_bottom.dart';
import 'package:appdautien/common/navigation_left.dart';
import 'package:appdautien/screen/common/network_controller.dart';
import 'package:appdautien/screen/common/network_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderAppbar extends StatelessWidget {
  final Widget body;
  final String title;
  final bool isDrawer;
  final bool? isConfirm;
  final String pathScreen;
  final Function()? onBackButtonPressed;
  final String? logoPath;

  HeaderAppbar({
    super.key,
    required this.body,
    required this.title,
    required this.isDrawer,
    required this.pathScreen,
    this.isConfirm,
    this.onBackButtonPressed,
    this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title, style: TextStyle(fontSize: 17))),
          backgroundColor: AppColor.blueAccentColor,
          foregroundColor: Colors.white,
          leading: isDrawer
              ? null
              : IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    if (onBackButtonPressed != null) {
                      onBackButtonPressed!();
                      Get.back();
                    } else {
                      Get.back();
                    }
                  },
                ),
          actions: [
            if (logoPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(logoPath!, height: screenHeight * 0.058),
              ),
          ],
        ),
        drawer: NavigationLeft(),
        bottomNavigationBar: title != "" ? NavigationBottom() : null,
        body:NetworkController().connectionStatus==0
            ? body
            : NetworkView(description: AppString.noInternet),
      ),
    );
  }
}
