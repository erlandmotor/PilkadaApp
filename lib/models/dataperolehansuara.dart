import 'package:json_annotation/json_annotation.dart';
part 'dataperolehansuara.g.dart';

@JsonSerializable()
class DataPerolehanSuara {
  int? id;
  String? jml_suara_sah;
  String? jml_suara_tidaksah;
  String? formulir_c1;
  String? foto_bukti_perolehan_suara;

  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;
  String? tps_id;
  String? saksi_id;

  DataPerolehanSuara(
      {this.id,
      this.jml_suara_sah,
      this.jml_suara_tidaksah,
      this.formulir_c1,
      this.foto_bukti_perolehan_suara,
      this.tps_id,
      this.saksi_id,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.villages_id});

  factory DataPerolehanSuara.fromJson(Map<String, dynamic> data) =>
      _$DataPerolehanSuaraFromJson(data);

  Map<String, dynamic> toJson() => _$DataPerolehanSuaraToJson(this);
}
