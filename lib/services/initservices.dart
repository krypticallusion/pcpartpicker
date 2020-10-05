import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> initAllServices() async {
  await GetStorage.init();
  bool isDark = GetStorage().read('isDark') ?? false;
  print(isDark);
  if (isDark)
    Get.changeThemeMode(ThemeMode.dark);
  else
    Get.changeThemeMode(ThemeMode.light);
}
