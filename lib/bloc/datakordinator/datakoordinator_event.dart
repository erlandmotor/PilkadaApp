part of 'datakoordinator_bloc.dart';

@immutable
abstract class DatakoordinatorEvent {}

class DataKoordinatorConnect extends DatakoordinatorEvent {
  String page;

  DataKoordinatorConnect({this.page = ''});
}

class TambahDataKoordinator extends DatakoordinatorEvent {
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

  TambahDataKoordinator(
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

class DataKoordinatorConnectKomunitas extends DatakoordinatorEvent {
  String page;

  DataKoordinatorConnectKomunitas({this.page = ''});
}

class DataKoordinatorSearchKabupaten extends DatakoordinatorEvent {
  String? value;

  DataKoordinatorSearchKabupaten({this.value});
}

class DataKoordinatorSearchKecamatan extends DatakoordinatorEvent {
  String? value;

  DataKoordinatorSearchKecamatan({this.value});
}

class DataKoordinatorSearchKelurahan extends DatakoordinatorEvent {
  String? value;

  DataKoordinatorSearchKelurahan({this.value});
}

class DataKoordinatorSearch extends DatakoordinatorEvent {
  String? value;

  DataKoordinatorSearch({this.value});
}

class DatakoorNew extends DatakoordinatorEvent {}

class KoorInput extends DatakoordinatorEvent {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;
  KoorInput({this.kabupaten, this.kecamatan, this.kelurahan});
}
