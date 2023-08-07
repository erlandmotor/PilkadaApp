import 'package:json_annotation/json_annotation.dart';
part 'dataKordinator.g.dart';

@JsonSerializable()
class DataKordinator {
  int? id;
  String? nama;
  String? nik;

  String? jkl;
  String? agama;
  String? alamat;
  String? no_wa;
  String? photo;
  String? scan_ktp;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;

  DataKordinator(
      {this.id,
      this.nama,
      this.nik,
      this.jkl,
      this.agama,
      this.no_wa,
      this.alamat,
      this.photo,
      this.scan_ktp,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.villages_id});

  factory DataKordinator.fromJson(Map<String, dynamic> data) =>
      _$DataKordinatorFromJson(data);

  Map<String, dynamic> toJson() => _$DataKordinatorToJson(this);
}
