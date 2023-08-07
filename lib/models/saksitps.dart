import 'package:json_annotation/json_annotation.dart';
part 'saksitps.g.dart';

@JsonSerializable()
class DataSaksi {
  String? nama;
  String? nik;
  String? alamat;
  String? tps_id;
  String? jkl;
  String? agama;
  String? no_wa;
  String? photo;
  String? villages_id;
  String? Province_id;
  String? regency_id;
  String? district_id;

  DataSaksi({
    this.nama,
    this.nik,
    this.tps_id,
    this.alamat,
    this.no_wa,
    this.agama,
    this.jkl,
    this.photo,
    this.villages_id,
    this.Province_id,
    this.regency_id,
    this.district_id,
  });

  factory DataSaksi.fromJson(Map<String, dynamic> data) =>
      _$DataSaksiFromJson(data);

  Map<String, dynamic> toJson() => _$DataSaksiToJson(this);
}
