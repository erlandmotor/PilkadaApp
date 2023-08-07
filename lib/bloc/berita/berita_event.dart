part of 'berita_bloc.dart';

@immutable
abstract class BeritaEvent {}

class BeritaConnect extends BeritaEvent {}

class CariBerita extends BeritaEvent {
  String? cari;

  CariBerita({this.cari});
}
