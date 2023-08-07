// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataKordinator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataKordinator _$DataKordinatorFromJson(Map<String, dynamic> json) =>
    DataKordinator(
      id: json['id'] as int?,
      nama: json['nama'] as String?,
      nik: json['nik'] as String?,
      jkl: json['jkl'] as String?,
      agama: json['agama'] as String?,
      no_wa: json['no_wa'] as String?,
      alamat: json['alamat'] as String?,
      photo: json['photo'] as String?,
      scan_ktp: json['scan_ktp'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
      villages_id: json['villages_id'] as String?,
    );

Map<String, dynamic> _$DataKordinatorToJson(DataKordinator instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'nik': instance.nik,
      'jkl': instance.jkl,
      'agama': instance.agama,
      'alamat': instance.alamat,
      'no_wa': instance.no_wa,
      'photo': instance.photo,
      'scan_ktp': instance.scan_ktp,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'villages_id': instance.villages_id,
    };
