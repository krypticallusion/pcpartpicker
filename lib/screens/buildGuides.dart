import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/components/components.dart';
import 'package:pcpartpicker/controllers/apicontroller.dart';
import 'package:pcpartpicker/entities/guides.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

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
  final APIService apiService = Get.find();

  Widget categoryWidget(Categories categories) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      StickyHeader(
        header: Container(
          height: 50.0,
          color: Colors.orangeAccent,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            categories.title,
            style: GoogleFonts.oswald(
                color: Get.textTheme.headline6.color, fontSize: 20),
          ),
        ),
        content: AnimationLimiter(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            itemCount: categories.guides.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              Guides guide = categories.guides[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    duration: Duration(milliseconds: 400),
                    child: InkWell(
                      splashColor: Colors.orangeAccent,
                      child: Card(
                          child: ListTile(
                              title: Text(guide.title,
                                  style: GoogleFonts.rubik(fontSize: 16)),
                              dense: true,
                              subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...guide.products
                                        .map<Widget>((c) => Text(
                                              c,
                                              style: TextStyle(fontSize: 12),
                                            ))
                                        .toList(),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlatButton.icon(
                                              onPressed: null,
                                              icon: Icon(Icons.monetization_on),
                                              label: Text(guide.price)),
                                          FlatButton.icon(
                                              onPressed: null,
                                              icon: Icon(Icons.comment),
                                              label: Text(
                                                  guide.comments.toString()))
                                        ])
                                  ]))),
                      onTap: () {
                        Get.to(GuideDetailsPage(path: guide.path));
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      )
    ]);
  }

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
              shrinkWrap: true,
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
