// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semuadatakecurangan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SemuaDataKecurangan _$SemuaDataKecuranganFromJson(Map<String, dynamic> json) =>
    SemuaDataKecurangan(
      nama_kecurangan: json['nama_kecurangan'] as String?,
      deskripsi: json['deskripsi'] as String?,
      fotoBukti_kecurangan: json['fotoBukti_kecurangan'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
      villages_id: json['villages_id'] as String?,
      tps_id: json['tps_id'] as String?,
    );

Map<String, dynamic> _$SemuaDataKecuranganToJson(
        SemuaDataKecurangan instance) =>
    <String, dynamic>{
      'nama_kecurangan': instance.nama_kecurangan,
      'deskripsi': instance.deskripsi,
      'fotoBukti_kecurangan': instance.fotoBukti_kecurangan,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'villages_id': instance.villages_id,
      'tps_id': instance.tps_id,
    };
