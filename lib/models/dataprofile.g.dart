// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataprofile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProfile _$DataProfileFromJson(Map<String, dynamic> json) => DataProfile(
      id: json['id'] as int?,
      name: json['name'] as String?,
      foto: json['foto'] as String?,
      email: json['email'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$DataProfileToJson(DataProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'foto': instance.foto,
      'role': instance.role,
    };
