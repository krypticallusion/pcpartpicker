import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pcpartpicker/entities/guides.dart';

final dioInstance =
    Dio(BaseOptions(baseUrl: "https://pcpartpicker.herokuapp.com"))
      ..options.connectTimeout = 10000;

Future getBuildGuides() async {
  try {
    final resp = await dioInstance.get('/guides');
    return BuildGuides.fromJson(json.decode(resp.data));
  } on DioError catch (Error) {
    return Error;
  }
}

Future getDetails({String path}) async {
  try {
    Dio dio = dioInstance;
    dio.options.headers = {"path": path};
    final resp = await dio.get('/gdetails');
    print(resp.data);
    return GuideDetails.fromJson(json.decode(resp.data));
  } on DioError catch (Error) {
    return Error;
  }
}
