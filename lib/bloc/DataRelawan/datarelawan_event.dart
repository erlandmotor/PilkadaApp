part of 'datarelawan_bloc.dart';

@immutable
abstract class DatarelawanEvent {}

class DataRelawanUtamaConnect extends DatarelawanEvent {
  String? id;

  DataRelawanUtamaConnect({this.id = ''});
}

class DataRelawanBiasaConnect extends DatarelawanEvent {
  String id;

  DataRelawanBiasaConnect({this.id = ''});
}

class TambahDataRelawanUtama extends DatarelawanEvent {
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

  TambahDataRelawanUtama(
      {this.nama,
      this.nik,
      this.alamat,
      this.jkl,
      this.agama,
      this.no_wa,
      this.scan_ktp,
      this.photo,
      this.Province_id,
      this.district_id,
      this.regency_id,
      this.villages_id});
}

class DataRelawanNewUtama extends DatarelawanEvent {}

class DataRelawanNewBiasa extends DatarelawanEvent {}

class DatarelawanUtamaSearch extends DatarelawanEvent {
  String? value;

  DatarelawanUtamaSearch({this.value});
}

class DatarelawanBiasaSearch extends DatarelawanEvent {
  String? value;

  DatarelawanBiasaSearch({this.value});
}

class TambahDataRelawanBiasa extends DatarelawanEvent {
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

  TambahDataRelawanBiasa(
      {this.nama,
      this.nik,
      this.alamat,
      this.jkl,
      this.agama,
      this.no_wa,
      this.scan_ktp,
      this.photo,
      this.Province_id,
      this.district_id,
      this.regency_id,
      this.villages_id});
}

class RelawanInput extends DatarelawanEvent {
  String? kabupaten;
  String? kecamatan;
  String? kelurahan;

  RelawanInput({this.kabupaten, this.kecamatan, this.kelurahan});
}

class RelawanDetail extends DatarelawanEvent {
  String id;

  RelawanDetail({this.id = ''});
}
