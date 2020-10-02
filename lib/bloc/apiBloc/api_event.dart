part of 'api_bloc.dart';

@immutable
abstract class ApiEvent {}

class FetchBuildGuides extends ApiEvent {}

class FetchGuideDetails extends ApiEvent {
  final String path;

  FetchGuideDetails({this.path});
}
