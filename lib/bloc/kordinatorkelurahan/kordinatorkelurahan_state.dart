part of 'kordinatorkelurahan_bloc.dart';

@immutable
abstract class KordinatorkelurahanState {}

class KordinatorkelurahanInitial extends KordinatorkelurahanState {}

class DataKoordinatorKelurahanLoaded extends KordinatorkelurahanState {
  List<DataKordinator>? data;

  DataKoordinatorKelurahanLoaded({
    this.data,
  });
}

class DatakoorKelurahanFailed extends KordinatorkelurahanState {
  String? err;
  DatakoorKelurahanFailed({this.err});
}

class DatakoorKelurahanSukses extends KordinatorkelurahanState {}

class DatakoorKelurahanLoading extends KordinatorkelurahanState {}

class KoorKelurahanOutput extends KordinatorkelurahanState {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  KoorKelurahanOutput({this.kabupaten, this.kecamatan, this.kelurahan});
}
