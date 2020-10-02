import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget apiError(DioError err) {
  var message;
  DioError _apiFetchedError = err;
  switch (_apiFetchedError.type) {
    case DioErrorType.DEFAULT:
      message =
          'Failed to connect to host,Please check your internet Connection';
      break;
    case DioErrorType.CONNECT_TIMEOUT:
      message = 'Failed to connect to host,Connection Timed Out';
      break;
    case DioErrorType.SEND_TIMEOUT:
      message = 'Failed to connect to host,Send timeout';
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      message = 'Failed to connect to host,Receive timeout';
      break;
    case DioErrorType.RESPONSE:
      message = 'Failed to connect to host, received 404';
      break;
    case DioErrorType.CANCEL:
      message = 'Failed to connect to host, Action cancelled by user';
      break;
  }
  return Center(
    child: Text(
      message,
      style: TextStyle(color: Colors.deepOrange),
    ),
  );
}
