import 'package:flutter/material.dart';
import 'package:pcpartpicker/screens/home.dart';
import 'package:pcpartpicker/services/initservices.dart';

void main() async {
  await initAllServices();
  runApp(HomePage());
}
