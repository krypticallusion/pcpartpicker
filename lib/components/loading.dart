import 'package:flutter/material.dart';

Widget loading() {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
    ),
  );
}
