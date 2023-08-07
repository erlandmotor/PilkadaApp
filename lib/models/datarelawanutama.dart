import 'package:json_annotation/json_annotation.dart';
import 'package:pilkada/models/datarelawanbiasa.dart';
part 'datarelawanutama.g.dart';

@JsonSerializable(explicitToJson: true)
class DataRelawanUtama {
  int? id;
  String? nama;
  String? scan_ktp;
  String? nik;
  String? alamat;
  String? no_wa;
  String? agama;
  String? jkl;
  String? photo;
  String? Province_id;
  String? regency_id;
  String? villages_id;
  String? district_id;
  List<Relawan_biasa>? relawan_biasa;

  DataRelawanUtama(
      {this.nama,
      this.id,
      this.scan_ktp,
      this.nik,
      this.alamat,
      this.no_wa,
      this.agama,
      this.jkl,
      this.photo,
      this.villages_id,
      this.Province_id,
      this.relawan_biasa,
      this.regency_id,
      this.district_id});

  factory DataRelawanUtama.fromJson(Map<String, dynamic> data) =>
      _$DataRelawanUtamaFromJson(data);

  Map<String, dynamic> toJson() => _$DataRelawanUtamaToJson(this);
}
