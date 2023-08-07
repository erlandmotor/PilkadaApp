part of 'datasaksi_bloc.dart';

@immutable
abstract class DatasaksiEvent {}

class DatasaksiConnect extends DatasaksiEvent {
  String page;

  DatasaksiConnect({this.page = ''});
}

class TambahDatasaksi extends DatasaksiEvent {
  String? nama_saksi;
  String? alamat;
  String? nik;

  String? no_hp;
  String? email;
  File? saksi;

  String? Province_id;
  String? regency_id;
  String? district_id;
  String? tps_id;
  String? role;
  String? password;

  TambahDatasaksi(
      {this.nama_saksi,
      this.alamat,
      this.nik,
      this.no_hp,
      this.email,
      this.saksi,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.tps_id,
      this.role,
      this.password});
}

class DatasaksiNew extends DatasaksiEvent {}

class DatasaksiSearch extends DatasaksiEvent {
  String? value;

  DatasaksiSearch({this.value});
}

class DatasaksiSearchKabuapten extends DatasaksiEvent {
  String? value;

  DatasaksiSearchKabuapten({this.value});
}

class DatasaksiSearchKecamatan extends DatasaksiEvent {
  String? value;

  DatasaksiSearchKecamatan({this.value});
}

class DatasaksiSearchKelurahan extends DatasaksiEvent {
  String? value;

  DatasaksiSearchKelurahan({this.value});
}
