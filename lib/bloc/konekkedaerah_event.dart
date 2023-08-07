part of 'konekkedaerah_bloc.dart';

@immutable
abstract class KonekkedaerahEvent {}

class ConnectKedaerah extends KonekkedaerahEvent {
  String provinsi;
  String kabupaten;
  String kecamatan;
  String kelurahan;

  ConnectKedaerah(
      {this.provinsi = '11',
      this.kabupaten = '1101',
      this.kecamatan = '1101010',
      this.kelurahan = '1101010001'});
}

class KonekDaerahdulu extends KonekkedaerahEvent {}

class ConnectKedaerahList extends KonekkedaerahEvent {
  List<String>? listprovinsi;
  List<String>? listkabupaten;
  List<String>? listkecamatan;
  List<String>? listdesa;

  ConnectKedaerahList(
      {this.listprovinsi,
      this.listkabupaten,
      this.listkecamatan,
      this.listdesa});
}
