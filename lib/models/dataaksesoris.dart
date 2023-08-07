import 'package:json_annotation/json_annotation.dart';
part 'dataaksesoris.g.dart';

@JsonSerializable()
class Dataaksesoris {
  String? relawanbiasas_id;
  String? jenis_aksesoris;
  String? tanggal_terima;
  String? foto_bukti;
  String? Province_id;
  String? regency_id;
  String? district_id;
  String? villages_id;
  String? relawan_id;

  Dataaksesoris(
      {this.relawanbiasas_id,
      this.jenis_aksesoris,
      this.tanggal_terima,
      this.foto_bukti,
      this.Province_id,
      this.regency_id,
      this.district_id,
      this.villages_id,
      this.relawan_id});

  factory Dataaksesoris.fromJson(Map<String, dynamic> data) =>
      _$DataaksesorisFromJson(data);

  Map<String, dynamic> toJson() => _$DataaksesorisToJson(this);
}
