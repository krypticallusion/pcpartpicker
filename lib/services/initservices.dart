import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pcpartpicker/controllers/apicontroller.dart';

Future<void> initAllServices() async {
  await GetStorage.init();
  Get.put(APIService());
  bool isDark = GetStorage().read('isDark') ?? false;
  if (isDark)
    Get.changeThemeMode(ThemeMode.dark);
  else
    Get.changeThemeMode(ThemeMode.light);
}
