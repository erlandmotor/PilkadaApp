import 'package:json_annotation/json_annotation.dart';
part 'Datadpt.g.dart';

@JsonSerializable()
class Datadpt {
  String? nama;
  String? nik;
  String? kk;
  String? alamat;

  String? jkl;
  String? agama;
  String? no_wa;

  String? foto;
  String? scan_ktp;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;

  Datadpt(
      {this.nama,
      this.nik,
      this.kk,
      this.jkl,
      this.agama,
      this.no_wa,
      this.foto,
      this.scan_ktp,
      this.Province_id,
      this.regency_id,
      this.villages_id,
      this.district_id});

  factory Datadpt.fromJson(Map<String, dynamic> data) =>
      _$DatadptFromJson(data);

  Map<String, dynamic> toJson() => _$DatadptToJson(this);
}
