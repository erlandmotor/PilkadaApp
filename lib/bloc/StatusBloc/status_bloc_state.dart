part of 'status_bloc_bloc.dart';

@immutable
abstract class StatusBlocState {}

class StatusBlocInitial extends StatusBlocState {}

class StatusLoading extends StatusBlocState {}

class StatusSukses extends StatusBlocState {}

class StatusFailed extends StatusBlocState {
  String? err;

  StatusFailed({this.err});
}
