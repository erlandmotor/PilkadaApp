part of 'konekkedaerah_bloc.dart';

@immutable
abstract class KonekkedaerahState {}

class KonekkedaerahInitial extends KonekkedaerahState {}

class KonekDaerahLoaded extends KonekkedaerahState {
  String? dataprovinsi;
  String? datakabupaten;
  String? datakecamatan;
  String? datakelurahan;

  KonekDaerahLoaded(
      {this.dataprovinsi,
      this.datakabupaten,
      this.datakecamatan,
      this.datakelurahan});
}

class KonekDaerahLoadedList extends KonekkedaerahState {
  List<String>? listprovinsi;
  List<String>? listkabupaten;
  List<String>? listkecamatan;
  List<String>? listdesa;

  KonekDaerahLoadedList(
      {this.listprovinsi,
      this.listkabupaten,
      this.listkecamatan,
      this.listdesa});
}
