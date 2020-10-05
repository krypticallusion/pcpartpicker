import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pcpartpicker/components/components.dart';
import 'package:pcpartpicker/controllers/apicontroller.dart';

import '../components/components.dart';
import '../entities/guides.dart';

TextStyle subTitle =
    GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle body = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w400, wordSpacing: 1.2);
TextAlign align = TextAlign.justify;

class GuideDetailsPage extends StatelessWidget {
  final String path;

  const GuideDetailsPage({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomDetailBar(),
          Expanded(child: BuildDetails(path: path))
        ],
      ),
    );
  }
}

class BuildDetails extends StatelessWidget {
  final String path;
  final APIService apiService = Get.find();
  BuildDetails({Key key, this.path});

  Widget buildDescription(GuideDetails gdetails) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: gdetails.isNullOrBlank
          ? Center(
              child: Text('Error retrieving details'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Description',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        decoration: TextDecoration.underline)),
                SizedBox(height: 10),
                Text('CPU', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.cpu, style: body, textAlign: align),
                SizedBox(height: 5),
                Text('MotherBoard', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.motherboard,
                    style: body, textAlign: align),
                SizedBox(height: 5),
                Text('Memory', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.memory,
                    style: body, textAlign: align),
                SizedBox(height: 5),
                Text('Storage', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.storage,
                    style: body, textAlign: align),
                SizedBox(height: 5),
                Text('GPU', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.gpu, style: body, textAlign: align),
                SizedBox(height: 5),
                Text('Case', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.descriptionCase,
                    style: body, textAlign: align),
                SizedBox(height: 5),
                Text('PSU', style: subTitle),
                SizedBox(height: 5),
                Text(gdetails.description.psu, style: body, textAlign: align),
                SizedBox(height: 5),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    apiService.fetchGuideDetails(path);
    return Obx(() {
      if (apiService.gDetails() != null) {
        if (apiService.gDetails().error != null)
          return apiError(apiService.gDetails().error);
        else {
          return buildDescription(apiService.gDetails().guideDetails);
        }
      } else
        return Center(
          child: CircularProgressIndicator(),
        );
    });
  }
}

class CustomDetailBar extends StatelessWidget {
  Widget titleWidget() {
    return RichText(
      text: TextSpan(
          style: GoogleFonts.oswald(
              fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
          children: [
            TextSpan(text: "GUIDE", style: TextStyle(color: Colors.black)),
            TextSpan(
              text: "DETAILS",
              style: TextStyle(color: Colors.orangeAccent),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20),
      child: Row(children: [titleWidget()]),
    );
  }
}
