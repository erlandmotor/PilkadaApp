import 'package:json_annotation/json_annotation.dart';
part 'datajenisaksesoris.g.dart';

@JsonSerializable()
class DataJenisaksesoris {
  int? id;
  String? nama_aksesoris;
  String? foto;

  DataJenisaksesoris({
    this.id,
    this.nama_aksesoris,
    this.foto,
  });

  factory DataJenisaksesoris.fromJson(Map<String, dynamic> data) =>
      _$DataJenisaksesorisFromJson(data);

  Map<String, dynamic> toJson() => _$DataJenisaksesorisToJson(this);
}
