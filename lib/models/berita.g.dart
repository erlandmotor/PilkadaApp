// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBerita _$DataBeritaFromJson(Map<String, dynamic> json) => DataBerita(
      judul: json['judul'] as String?,
      foto: json['foto'] as String?,
      isi: json['isi'] as String?,
    );

Map<String, dynamic> _$DataBeritaToJson(DataBerita instance) =>
    <String, dynamic>{
      'judul': instance.judul,
      'isi': instance.isi,
      'foto': instance.foto,
    };
