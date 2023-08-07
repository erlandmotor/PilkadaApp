import 'package:json_annotation/json_annotation.dart';
part 'datarelawanbiasa.g.dart';

@JsonSerializable()
class Relawan_biasa {
  String? nama;
  String? scan_ktp;
  String? nik;
  String? alamat;
  String? no_wa;
  String? agama;
  String? jkl;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;

  Relawan_biasa(
      {this.nama,
      this.scan_ktp,
      this.nik,
      this.alamat,
      this.no_wa,
      this.agama,
      this.jkl,
      this.Province_id,
      this.regency_id,
      this.villages_id,
      this.district_id});

  factory Relawan_biasa.fromJson(Map<String, dynamic> data) =>
      _$Relawan_biasaFromJson(data);

  Map<String, dynamic> toJson() => _$Relawan_biasaToJson(this);
}
