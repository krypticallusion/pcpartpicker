import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  Widget titleWidget(context) {
    return RichText(
        text: TextSpan(
            style: GoogleFonts.oswald(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Theme.of(context).textTheme.headline6.color),
            children: [
          TextSpan(
            text: "PC",
          ),
          TextSpan(text: "PART", style: TextStyle(color: Colors.orangeAccent)),
          TextSpan(
            text: "PICKER",
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          titleWidget(context),
          IconButton(
            onPressed: () {
              bool isDark = false;
              if (Get.theme.brightness == Brightness.dark) isDark = true;
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
              GetStorage().write('isDark', !isDark);
            },
            icon: Icon(Icons.brightness_medium),
          )
        ]));
  }
}
