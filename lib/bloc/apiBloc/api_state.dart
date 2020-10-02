part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class ApiFetching extends ApiState {}

class ApiFetched extends ApiState {
  final BuildGuides buildGuides;
  final GuideDetails guideDetails;

  ApiFetched({this.buildGuides, this.guideDetails});
}

class ApiFetchedError extends ApiState {
  final DioError dioError;

  ApiFetchedError(this.dioError);
}
