// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataaksesoris.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dataaksesoris _$DataaksesorisFromJson(Map<String, dynamic> json) =>
    Dataaksesoris(
      relawanbiasas_id: json['relawanbiasas_id'] as String?,
      jenis_aksesoris: json['jenis_aksesoris'] as String?,
      tanggal_terima: json['tanggal_terima'] as String?,
      foto_bukti: json['foto_bukti'] as String?,
      Province_id: json['Province_id'] as String?,
      regency_id: json['regency_id'] as String?,
      district_id: json['district_id'] as String?,
      villages_id: json['villages_id'] as String?,
      relawan_id: json['relawan_id'] as String?,
    );

Map<String, dynamic> _$DataaksesorisToJson(Dataaksesoris instance) =>
    <String, dynamic>{
      'relawanbiasas_id': instance.relawanbiasas_id,
      'jenis_aksesoris': instance.jenis_aksesoris,
      'tanggal_terima': instance.tanggal_terima,
      'foto_bukti': instance.foto_bukti,
      'Province_id': instance.Province_id,
      'regency_id': instance.regency_id,
      'district_id': instance.district_id,
      'villages_id': instance.villages_id,
      'relawan_id': instance.relawan_id,
    };
