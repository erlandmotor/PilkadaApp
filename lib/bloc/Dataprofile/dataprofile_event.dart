part of 'dataprofile_bloc.dart';

@immutable
abstract class DataprofileEvent {}

class DataProfileConnect extends DataprofileEvent {}

class DataProfileUpdate extends DataprofileEvent {
  String? id;
  String? email;
  String? password;
  String? name;

  DataProfileUpdate({this.id, this.email, this.name, this.password});
}

class DataprofileNew extends DataprofileEvent {}
