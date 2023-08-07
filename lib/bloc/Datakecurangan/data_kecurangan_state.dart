part of 'data_kecurangan_bloc.dart';

@immutable
abstract class DataKecuranganState {}

class DataKecuranganInitial extends DataKecuranganState {}

class DataKecuranganLoaded extends DataKecuranganState {
  List<SemuaDataKecurangan>? data;
  List<String>? kabupaten;
  List<String>? kecamatan;
  List<String>? kelurahan;
  DataKecuranganLoaded(
      {this.data, this.kabupaten, this.kecamatan, this.kelurahan});
}

class DataKecuranganLoading extends DataKecuranganState {}

class DataKecuranganFailed extends DataKecuranganState {
  String? err;

  DataKecuranganFailed({this.err});
}

class DataKecuranganSukses extends DataKecuranganState {}

class KecuranganOutput extends DataKecuranganState {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  String? tps;

  KecuranganOutput({this.kabupaten, this.kecamatan, this.kelurahan, this.tps});
}
