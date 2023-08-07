import 'package:json_annotation/json_annotation.dart';
part 'dataprofile.g.dart';

@JsonSerializable()
class DataProfile {
  int? id;
  String? name;
  String? email;
  String? foto;
  String? role;

  DataProfile({this.id, this.name, this.foto, this.email, this.role});

  factory DataProfile.fromJson(Map<String, dynamic> data) =>
      _$DataProfileFromJson(data);

  Map<String, dynamic> toJson() => _$DataProfileToJson(this);
}
