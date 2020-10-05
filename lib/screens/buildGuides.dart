import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/components/components.dart';
import 'package:pcpartpicker/controllers/apicontroller.dart';
import 'package:pcpartpicker/entities/guides.dart';

import '../entities/guides.dart';
import 'guideDetails.dart';

class BuildGuidesPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CustomBuildGuideBar(),
      Expanded(child: BuildsWidget())
    ]));
  }
}

class BuildsWidget extends StatelessWidget {
  Widget categoryWidget(Categories categories) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(categories.title,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500, fontSize: 18),
              textAlign: TextAlign.start)),
      ...categories.guides.map((e) {
        return InkWell(
          splashColor: Colors.orangeAccent,
          child: Card(
              child: ListTile(
                  title: Text(e.title, style: GoogleFonts.rubik(fontSize: 16)),
                  dense: true,
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...e.products
                            .map<Widget>((c) => Text(
                                  c,
                                  style: TextStyle(fontSize: 12),
                                ))
                            .toList(),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlatButton.icon(
                                  onPressed: null,
                                  icon: Icon(Icons.monetization_on),
                                  label: Text(e.price)),
                              FlatButton.icon(
                                  onPressed: null,
                                  icon: Icon(Icons.comment),
                                  label: Text(e.comments.toString()))
                            ])
                      ]))),
          onTap: () {
            Get.to(GuideDetailsPage(path: e.path));
          },
        );
      })
    ]);
  }

  final APIService apiService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (apiService.guideDetails() == null) {
        return Center(child: CircularProgressIndicator());
      } else {
        if (apiService.guideDetails()?.error ?? false)
          return apiError(apiService.guideDetails().error);
        else {
          return ListView(
              physics: BouncingScrollPhysics(),
              children: apiService
                  .guideDetails()
                  .buildGuides
                  .categories
                  .map<Widget>((e) => categoryWidget(e))
                  .toList());
        }
      }
    });
  }
}

class CustomBuildGuideBar extends StatelessWidget {
  Widget titleWidget(context) {
    return RichText(
      text: TextSpan(
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold,
              fontSize: 27,
              color: Theme.of(context).textTheme.headline6.color),
          children: [
            TextSpan(text: "PC"),
            TextSpan(
              text: "PART",
              style: TextStyle(color: Colors.orangeAccent),
            ),
            TextSpan(text: "PICKER"),
            TextSpan(
              text: " / ",
              style: TextStyle(color: Colors.orangeAccent),
            ),
            TextSpan(text: "GUIDES")
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20),
        child: Row(children: [titleWidget(context)]));
  }
}
