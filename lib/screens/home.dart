import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/bloc/apiBloc/api_bloc.dart';
import 'package:pcpartpicker/theme/theme.dart';

import 'buildGuides.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetMaterialApp(
        onInit: () => BlocProvider.of<ApiBloc>(context).add(FetchBuildGuides()),
        theme: customThemeData,
        home: PcPartsHome(),
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
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        cardWidget("SYSTEM \n BUILDER", Icons.settings, '/'),
        cardWidget("BUILD \n GUIDES", Icons.assignment, '/buildGuide'),
        cardWidget("COMPLETED \n BUILDS", Icons.assignment_turned_in, '/')
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget {
  Widget titleWidget() {
    return RichText(
        text: TextSpan(
            style: GoogleFonts.oswald(
                fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
            children: [
          TextSpan(text: "PC"),
          TextSpan(text: "PART", style: TextStyle(color: Colors.orangeAccent)),
          TextSpan(text: "PICKER")
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Row(children: [titleWidget()]));
  }
}
