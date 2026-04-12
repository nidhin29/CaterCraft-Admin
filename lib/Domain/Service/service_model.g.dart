// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    _ServiceModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      rate: (json['rate'] as num).toDouble(),
      duration: json['duration'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ServiceModelToJson(_ServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'duration': instance.duration,
      'description': instance.description,
      'image': instance.image,
    };
