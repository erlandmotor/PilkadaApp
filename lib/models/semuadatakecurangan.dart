import 'package:json_annotation/json_annotation.dart';
part 'semuadatakecurangan.g.dart';

@JsonSerializable()
class SemuaDataKecurangan {
  String? nama_kecurangan;
  String? deskripsi;
  String? fotoBukti_kecurangan;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;
  String? tps_id;

  SemuaDataKecurangan(
      {this.nama_kecurangan,
      this.deskripsi,
      this.fotoBukti_kecurangan,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.villages_id,
      this.tps_id});

  factory SemuaDataKecurangan.fromJson(Map<String, dynamic> data) =>
      _$SemuaDataKecuranganFromJson(data);

  Map<String, dynamic> toJson() => _$SemuaDataKecuranganToJson(this);
}
