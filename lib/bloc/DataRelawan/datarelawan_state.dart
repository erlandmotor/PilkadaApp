part of 'datarelawan_bloc.dart';

@immutable
abstract class DatarelawanState {}

class DatarelawanInitial extends DatarelawanState {}

class DataRelawanLoaded extends DatarelawanState {
  List<DataRelawanUtama>? data;

  DataRelawanLoaded({
    this.data,
  });
}

class DataGruprelawanLoaded extends DatarelawanState {
  List<DataGruprelawan>? data;

  DataGruprelawanLoaded({this.data});
}

class DatarelawanLoading extends DatarelawanState {}

class DatarelawanSukses extends DatarelawanState {}

class DatarelawanFailed extends DatarelawanState {
  String? err;

  DatarelawanFailed({this.err});
}

class RelawanOutput extends DatarelawanState {
  String? kabupaten;
  String? kelurahan;
  String? kecamatan;
  RelawanOutput({this.kabupaten, this.kelurahan, this.kecamatan});
}

class RelawanDetailLoaded extends DatarelawanState {
  List<DataRelawanUtama>? data;
  RelawanDetailLoaded({this.data});
}
