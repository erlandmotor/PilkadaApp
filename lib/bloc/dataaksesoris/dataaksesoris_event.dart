part of 'dataaksesoris_bloc.dart';

@immutable
abstract class DataaksesorisEvent {}

class DataaksesorisConnect extends DataaksesorisEvent {
  String? page;

  DataaksesorisConnect({this.page});
}

class DataaksesorisSearch extends DataaksesorisEvent {
  String? value;

  DataaksesorisSearch({this.value});
}

class TambahDataPenerima extends DataaksesorisEvent {
  String? relawanbiasas_id;
  String? jenis_aksesoris;
  String? tanggal_terima;
  File? foto_bukti;
  String? provinsi;
  String? regency;
  String? district;
  String? villages;

  TambahDataPenerima(
      {this.relawanbiasas_id,
      this.jenis_aksesoris,
      this.tanggal_terima,
      this.district,
      this.foto_bukti,
      this.provinsi,
      this.regency,
      this.villages});
}

class DataAksesorisNew extends DataaksesorisEvent {}

class PenerimaSearchKabupaten extends DataaksesorisEvent {
  String? value;

  PenerimaSearchKabupaten({this.value});
}

class PenerimaSearchKecamatan extends DataaksesorisEvent {
  String? value;

  PenerimaSearchKecamatan({this.value});
}

class PenerimaSearchkelurahan extends DataaksesorisEvent {
  String? value;

  PenerimaSearchkelurahan({this.value});
}

class PenerimaInput extends DataaksesorisEvent {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;

  PenerimaInput({this.kabupaten, this.kecamatan, this.kelurahan});
}

class Penerimarelawaninput extends DataaksesorisEvent {
  String? namarelawan;

  Penerimarelawaninput({this.namarelawan});
}
