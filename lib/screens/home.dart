import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/components/customAppBar.dart';
import 'package:pcpartpicker/theme/theme.dart';
import 'buildGuides.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: PcPartsHome(),
        debugShowCheckedModeBanner: false,
        title: 'PcPartsPicker',
        enableLog: true,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => PcPartsHome()),
          GetPage(name: '/buildGuide', page: () => BuildGuidesPage())
        ]);
  }
}

class PcPartsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [CustomAppBar(), CustomGrid()]));
  }
}

class CustomGrid extends StatelessWidget {
  Widget cardWidget(String name, IconData icon, String routeName) {
    return Container(
        padding: EdgeInsets.all(10),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10),
            child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(icon, size: 75),
                          Text(name,
                              style: GoogleFonts.oswald(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center)
                        ]))),
            onTap: () => Get.toNamed(routeName)));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimationLimiter(
          child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        children: [
          AnimationConfiguration.staggeredGrid(
            position: 0,
            duration: const Duration(milliseconds: 375),
            columnCount: 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: cardWidget("SYSTEM \n BUILDER", Icons.settings, '/'),
              ),
            ),
          ),
          AnimationConfiguration.staggeredGrid(
            position: 1,
            duration: const Duration(milliseconds: 375),
            columnCount: 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: cardWidget(
                    "BUILD \n GUIDES", Icons.assignment, '/buildGuide'),
              ),
            ),
          ),
          AnimationConfiguration.staggeredGrid(
            position: 2,
            duration: const Duration(milliseconds: 375),
            columnCount: 3,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: cardWidget(
                    "COMPLETED \n BUILDS", Icons.assignment_turned_in, '/'),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
