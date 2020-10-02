import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pcpartpicker/api/api.dart';
import 'package:pcpartpicker/entities/guides.dart';

part 'api_event.dart';

part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiFetching());

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    switch (event.runtimeType) {
      case FetchBuildGuides:
        {
          yield ApiFetching();
          var result = await getBuildGuides();
          if (result.runtimeType == DioError) {
            yield ApiFetchedError(result as DioError);
          } else if (result.runtimeType == BuildGuides) {
            yield ApiFetched(buildGuides: result);
          }
          break;
        }
      case FetchGuideDetails:
        {
          yield ApiFetching();
          var result = await getDetails(path: FetchGuideDetails().path);
          if (result.runtimeType == DioError) {
            yield ApiFetchedError(result as DioError);
          } else if (result.runtimeType == BuildGuides) {
            yield ApiFetched(guideDetails: result);
          }
          break;
        }
    }
  }
}
