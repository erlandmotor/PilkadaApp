part of 'datakoordinator_bloc.dart';

@immutable
abstract class DatakoordinatorState {}

class DatakoordinatorInitial extends DatakoordinatorState {}

class DataKoordinatorLoaded extends DatakoordinatorState {
  List<DataKordinator>? data;

  DataKoordinatorLoaded({
    this.data,
  });
}

class DataKoordinatorKomunitas extends DatakoordinatorState {
  List<DataKordinatorKomunitas>? data;

  DataKoordinatorKomunitas({this.data});
}

class DatakoorFailed extends DatakoordinatorState {
  String? err;
  DatakoorFailed({this.err});
}

class DatakoorSukses extends DatakoordinatorState {}

class DatakoorLoading extends DatakoordinatorState {}

class KoorOutput extends DatakoordinatorState {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  KoorOutput({this.kabupaten, this.kecamatan, this.kelurahan});
}
