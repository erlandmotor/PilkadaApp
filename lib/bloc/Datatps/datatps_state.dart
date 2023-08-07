part of 'datatps_bloc.dart';

@immutable
abstract class DatatpsState {}

class DatatpsInitial extends DatatpsState {}

class DatatpsLoaded extends DatatpsState {
  List<Datatps>? data;
  List<String>? datakabupaten;
  List<String>? dataprovinsi;
  List<String>? datakecamatan;
  List<String>? datakelurahan;
  DatatpsLoaded(
      {this.data,
      this.datakabupaten,
      this.dataprovinsi,
      this.datakecamatan,
      this.datakelurahan});
}

class DatatpsUpdate extends DatatpsState {
  bool? update;

  DatatpsUpdate({this.update});
}
