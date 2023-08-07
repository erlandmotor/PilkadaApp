part of 'status_bloc_bloc.dart';

@immutable
abstract class StatusBlocEvent {}

class EventStatusLoading extends StatusBlocEvent {}

class EventStatusFailed extends StatusBlocEvent {
  String? err;

  EventStatusFailed({this.err});
}

class EventStatusSukses extends StatusBlocEvent {}
