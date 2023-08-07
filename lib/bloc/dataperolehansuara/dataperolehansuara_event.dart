part of 'dataperolehansuara_bloc.dart';

@immutable
abstract class DataperolehansuaraEvent {}

class DataPerolehanSuaraConnect extends DataperolehansuaraEvent {
  String page;

  DataPerolehanSuaraConnect({this.page = ''});
}

class DataPerolehanSuaraCari extends DataperolehansuaraEvent {
  String? value;

  DataPerolehanSuaraCari({this.value});
}

class DataPerolehanSuaraCreate extends DataperolehansuaraEvent {
  String? jml_suara_sah;
  String? jml_suara_tidaksah;
  File? foto_bukti_perolehan_suara;

  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;
  String? tps_id;
  File? formulir_c1;

  String? data_kecurangan;
  DataPerolehanSuaraCreate({
    this.jml_suara_sah,
    this.jml_suara_tidaksah,
    this.foto_bukti_perolehan_suara,
    this.Province_id,
    this.regency_id,
    this.district_id,
    this.villages_id,
    this.tps_id,
    this.formulir_c1,
  });
}

class DPSNew extends DataperolehansuaraEvent {}

class DPScariKabupaten extends DataperolehansuaraEvent {
  String? value;

  DPScariKabupaten({this.value});
}

class DPScariKecamatan extends DataperolehansuaraEvent {
  String? value;

  DPScariKecamatan({this.value});
}

class DPScariKelurahan extends DataperolehansuaraEvent {
  String? value;

  DPScariKelurahan({this.value});
}

class DPSInput extends DataperolehansuaraEvent {
  String? kabupaten;
  String? kelurahan;
  String? kecamatan;
  String? tps;

  DPSInput({this.kabupaten, this.kelurahan, this.kecamatan, this.tps});
}
