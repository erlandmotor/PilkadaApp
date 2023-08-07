// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datarelawanbiasa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relawan_biasa _$Relawan_biasaFromJson(Map<String, dynamic> json) =>
    Relawan_biasa(
      nama: json['nama'] as String?,
      scan_ktp: json['scan_ktp'] as String?,
      nik: json['nik'] as String?,
      alamat: json['alamat'] as String?,
      no_wa: json['no_wa'] as String?,
      agama: json['agama'] as String?,
      jkl: json['jkl'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      villages_id: json['villages_id'] as String?,
      district_id: json['district_id'] as String?,
    );

Map<String, dynamic> _$Relawan_biasaToJson(Relawan_biasa instance) =>
    <String, dynamic>{
      'nama': instance.nama,
      'scan_ktp': instance.scan_ktp,
      'nik': instance.nik,
      'alamat': instance.alamat,
      'no_wa': instance.no_wa,
      'agama': instance.agama,
      'jkl': instance.jkl,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'villages_id': instance.villages_id,
    };
