part of 'berita_bloc.dart';

@immutable
abstract class BeritaState {}

class BeritaInitial extends BeritaState {}

class BeritaLoaded extends BeritaState {
  List<DataBerita>? berita;

  BeritaLoaded({this.berita});
}
