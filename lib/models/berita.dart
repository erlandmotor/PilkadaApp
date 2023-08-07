import 'package:json_annotation/json_annotation.dart';
part 'berita.g.dart';

@JsonSerializable()
class DataBerita {
  String? judul;
  String? isi;
  String? foto;

  DataBerita({this.judul, this.foto, this.isi});

  factory DataBerita.fromJson(Map<String, dynamic> data) =>
      _$DataBeritaFromJson(data);

  Map<String, dynamic> toJson() => _$DataBeritaToJson(this);
}
