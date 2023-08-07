// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saksitps.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSaksi _$DataSaksiFromJson(Map<String, dynamic> json) => DataSaksi(
      nama: json['nama'] as String?,
      nik: json['nik'] as String?,
      tps_id: json['tps_id'] as String?,
      alamat: json['alamat'] as String?,
      no_wa: json['no_wa'] as String?,
      agama: json['agama'] as String?,
      jkl: json['jkl'] as String?,
      photo: json['photo'] as String?,
      villages_id: json['villages_id'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
    );

Map<String, dynamic> _$DataSaksiToJson(DataSaksi instance) => <String, dynamic>{
      'nama': instance.nama,
      'nik': instance.nik,
      'alamat': instance.alamat,
      'tps_id': instance.tps_id,
      'jkl': instance.jkl,
      'agama': instance.agama,
      'no_wa': instance.no_wa,
      'photo': instance.photo,
      'villages_id': instance.villages_id,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
    };
