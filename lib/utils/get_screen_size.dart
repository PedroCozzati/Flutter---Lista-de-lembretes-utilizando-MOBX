import 'package:flutter/material.dart';

class DeviceInfo {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  DeviceInfo() {
    _init();
  }

  void _init() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateDeviceInfo();
    });
  }

  static void updateDeviceInfo() {
    final MediaQueryData mediaQuery = MediaQueryData.fromView(WidgetsBinding.instance.window);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }
}