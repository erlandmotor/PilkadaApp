part of 'dataaksesoris_bloc.dart';

@immutable
abstract class DataaksesorisState {}

class DataaksesorisInitial extends DataaksesorisState {}

class Dataaksesorisloaded extends DataaksesorisState {
  List<Dataaksesoris>? data;
  List<String>? jenisaksesoris;
  List<String>? listrelawan;

  Dataaksesorisloaded({this.data, this.jenisaksesoris, this.listrelawan});
}

class DataaksesorisLoading extends DataaksesorisState {}

class DataaksesorisSukses extends DataaksesorisState {}

class DataaksesorisFailed extends DataaksesorisState {
  String? err;

  DataaksesorisFailed({this.err});
}

class PenerimaOutput extends DataaksesorisState {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;

  PenerimaOutput({this.kabupaten, this.kecamatan, this.kelurahan});
}

class PenerimarelawanOutput extends DataaksesorisState {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;

  PenerimarelawanOutput({this.kabupaten, this.kecamatan, this.kelurahan});
}
