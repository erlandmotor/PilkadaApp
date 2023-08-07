part of 'dataperolehansuara_bloc.dart';

@immutable
abstract class DataperolehansuaraState {}

class DataperolehansuaraInitial extends DataperolehansuaraState {}

class DataPerolehanSuaraLoaded extends DataperolehansuaraState {
  List<DataPerolehanSuara>? data;
  List<String>? kabupaten;
  List<String>? kecamatan;
  List<String>? provinsi;
  List<String>? kelurahan;

  DataPerolehanSuaraLoaded(
      {this.data,
      this.kabupaten,
      this.kecamatan,
      this.provinsi,
      this.kelurahan});
}

class DPSloading extends DataperolehansuaraState {}

class DPSFailed extends DataperolehansuaraState {
  String? err;

  DPSFailed({this.err});
}

class DPSSukses extends DataperolehansuaraState {}

class DPSOutput extends DataperolehansuaraState {
  String? kabupaten;
  String? kelurahan;
  String? kecamatan;
  String? tps;

  DPSOutput({this.kabupaten, this.kelurahan, this.kecamatan, this.tps});
}
