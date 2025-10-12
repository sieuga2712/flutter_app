import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkController extends GetxController {
  var connectionStatus = 0.obs;
  late StreamSubscription<InternetConnectionStatus> hasConnection;
  @override
  void onInit() async {
    super.onInit();

    hasConnection = InternetConnectionChecker.createInstance()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
          switch (status) {
            case InternetConnectionStatus.connected:
              connectionStatus.value = 1;
              break;
            case InternetConnectionStatus.disconnected:
              connectionStatus.value = 0;
              break;
            case InternetConnectionStatus.slow:
              connectionStatus.value = 2; // tuỳ bạn gán kiểu gì
              break;
          }
        });
  }

  @override
  void onClose() {
    super.onClose();
    hasConnection.cancel();
  }
}
