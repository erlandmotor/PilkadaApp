// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datarelawanutama.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataRelawanUtama _$DataRelawanUtamaFromJson(Map<String, dynamic> json) =>
    DataRelawanUtama(
      nama: json['nama'] as String?,
      id: json['id'] as int?,
      scan_ktp: json['scan_ktp'] as String?,
      nik: json['nik'] as String?,
      alamat: json['alamat'] as String?,
      no_wa: json['no_wa'] as String?,
      agama: json['agama'] as String?,
      jkl: json['jkl'] as String?,
      photo: json['photo'] as String?,
      villages_id: json['villages_id'] as String?,
      Province_id: json['Province_id'] as String?,
      relawan_biasa: (json['relawan_biasa'] as List<dynamic>?)
          ?.map((e) => Relawan_biasa.fromJson(e as Map<String, dynamic>))
          .toList(),
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
    );

Map<String, dynamic> _$DataRelawanUtamaToJson(DataRelawanUtama instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
      'scan_ktp': instance.scan_ktp,
      'nik': instance.nik,
      'alamat': instance.alamat,
      'no_wa': instance.no_wa,
      'agama': instance.agama,
      'jkl': instance.jkl,
      'photo': instance.photo,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'villages_id': instance.villages_id,
      'district_id': instance.district_id,
      'relawan_biasa': instance.relawan_biasa?.map((e) => e.toJson()).toList(),
    };
