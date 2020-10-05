import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pcpartpicker/entities/guides.dart';

import '../entities/guides.dart';
import '../entities/guides.dart';
import '../entities/guides.dart';

final dioInstance =
    Dio(BaseOptions(baseUrl: "https://pcpartpicker.herokuapp.com"))
      ..options.connectTimeout = 10000;

class RxBuildGuides {
  BuildGuides buildGuides;
  DioError error;
  RxBuildGuides(this.buildGuides, this.error);
}

class RxGuideDetails {
  GuideDetails guideDetails;
  DioError error;
  RxGuideDetails(this.guideDetails, this.error);
}

Future getBuildGuides() async {
  try {
    final resp = await dioInstance.get('/guides');
    return RxBuildGuides(BuildGuides.fromJson(json.decode(resp.data)), null);
  } on DioError catch (err) {
    return RxBuildGuides(null, err);
  }
}

Future getDetails({String path}) async {
  try {
    Dio dio = dioInstance;
    dio.options.headers = {"path": path};
    final resp = await dio.get('/gdetails');
    return RxGuideDetails(GuideDetails.fromJson(json.decode(resp.data)), null);
  } on DioError catch (err) {
    return RxGuideDetails(null, err);
  }
}
