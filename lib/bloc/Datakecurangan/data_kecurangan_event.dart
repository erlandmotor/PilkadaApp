part of 'data_kecurangan_bloc.dart';

@immutable
abstract class DataKecuranganEvent {}

class DataKecuranganConnect extends DataKecuranganEvent {
  String? page;

  DataKecuranganConnect({this.page});
}

class DataKecuranganSearchKabupaten extends DataKecuranganEvent {
  String? value;

  DataKecuranganSearchKabupaten({this.value});
}

class DataKecuranganSearchKecamatan extends DataKecuranganEvent {
  String? value;

  DataKecuranganSearchKecamatan({this.value});
}

class DataKecuranganSearchKelurahan extends DataKecuranganEvent {
  String? value;

  DataKecuranganSearchKelurahan({this.value});
}

class DataKecuranganNew extends DataKecuranganEvent {}

class DataKecuranganCreate extends DataKecuranganEvent {
  String? nama_kecurangan;
  String? deskripsi;
  File? fotoBukti_kecurangan;
  String? tps_id;
  String? province;
  String? regency;
  String? district;
  String? villages;

  DataKecuranganCreate(
      {this.nama_kecurangan,
      this.deskripsi,
      this.fotoBukti_kecurangan,
      this.tps_id,
      this.province,
      this.regency,
      this.district,
      this.villages});
}

class KecuranganInput extends DataKecuranganEvent {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  String? tps;

  KecuranganInput({this.kabupaten, this.kecamatan, this.kelurahan, this.tps});
}
