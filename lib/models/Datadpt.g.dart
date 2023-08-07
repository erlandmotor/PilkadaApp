// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Datadpt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datadpt _$DatadptFromJson(Map<String, dynamic> json) => Datadpt(
      nama: json['nama'] as String?,
      nik: json['nik'] as String?,
      kk: json['kk'] as String?,
      jkl: json['jkl'] as String?,
      agama: json['agama'] as String?,
      no_wa: json['no_wa'] as String?,
      foto: json['foto'] as String?,
      scan_ktp: json['scan_ktp'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      villages_id: json['villages_id'] as String?,
      district_id: json['district_id'] as String?,
    )..alamat = json['alamat'] as String?;

Map<String, dynamic> _$DatadptToJson(Datadpt instance) => <String, dynamic>{
      'nama': instance.nama,
      'nik': instance.nik,
      'kk': instance.kk,
      'alamat': instance.alamat,
      'jkl': instance.jkl,
      'agama': instance.agama,
      'no_wa': instance.no_wa,
      'foto': instance.foto,
      'scan_ktp': instance.scan_ktp,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'villages_id': instance.villages_id,
    };
