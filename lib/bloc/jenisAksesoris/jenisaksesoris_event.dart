part of 'jenisaksesoris_bloc.dart';

@immutable
abstract class JenisaksesorisEvent {}

class JenisAksesorisConnect extends JenisaksesorisEvent {}

class CreateJenisAksesoris extends JenisaksesorisEvent {
  String? nama_aksesoris;
  File? foto;

  CreateJenisAksesoris({this.nama_aksesoris, this.foto});
}

class JenisAksesorisNew extends JenisaksesorisEvent {}

class JenisAksesorisSearch extends JenisaksesorisEvent {
  String? value;
  JenisAksesorisSearch({this.value});
}
