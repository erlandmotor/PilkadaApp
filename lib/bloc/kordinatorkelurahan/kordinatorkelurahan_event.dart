part of 'kordinatorkelurahan_bloc.dart';

@immutable
abstract class KordinatorkelurahanEvent {}

class DataKoordinatorKelurahanConnect extends KordinatorkelurahanEvent {
  String page;

  DataKoordinatorKelurahanConnect({this.page = ''});
}

class TambahDataKoordinatorKelurahan extends KordinatorkelurahanEvent {
  String? nama;
  String? nik;
  String? alamat;
  String? jkl;
  String? agama;
  File? scan_ktp;
  String? no_wa;

  File? photo;

  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;

  TambahDataKoordinatorKelurahan(
      {this.nama,
      this.nik,
      this.alamat,
      this.villages_id,
      this.district_id,
      this.jkl,
      this.agama,
      this.no_wa,
      this.photo,
      this.Province_id,
      this.regency_id,
      this.scan_ktp});
}

class DataKoordinatorKelurahanSearchKabupaten extends KordinatorkelurahanEvent {
  String? value;

  DataKoordinatorKelurahanSearchKabupaten({this.value});
}

class DataKoordinatorKelurahanSearchKecamatan extends KordinatorkelurahanEvent {
  String? value;

  DataKoordinatorKelurahanSearchKecamatan({this.value});
}

class DataKoordinatorKelurahanSearchKelurahan extends KordinatorkelurahanEvent {
  String? value;

  DataKoordinatorKelurahanSearchKelurahan({this.value});
}

class DataKoordinatorKelurahanSearch extends KordinatorkelurahanEvent {
  String? value;

  DataKoordinatorKelurahanSearch({this.value});
}

class DatakoorNew extends KordinatorkelurahanEvent {}

class KoorKelurahanInput extends KordinatorkelurahanEvent {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  KoorKelurahanInput({this.kabupaten, this.kecamatan, this.kelurahan});
}
