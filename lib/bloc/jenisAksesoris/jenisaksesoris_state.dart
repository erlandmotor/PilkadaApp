part of 'jenisaksesoris_bloc.dart';

@immutable
abstract class JenisaksesorisState {}

class JenisaksesorisInitial extends JenisaksesorisState {}

class JenisAksesorisLoaded extends JenisaksesorisState {
  List<DataJenisaksesoris>? data;

  JenisAksesorisLoaded({this.data});
}

class JenisAkLoading extends JenisaksesorisState {}

class JenisAkFailed extends JenisaksesorisState {
  String? err;

  JenisAkFailed({this.err});
}

class JenisAkSukses extends JenisaksesorisState {}
