// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) =>
    _ServiceModel(
      id: json['_id'] as String?,
      name: json['service_name'] as String,
      rate: json['rate'] as num,
      duration: json['duration'] as String?,
      description: json['description'] as String?,
      image: json['imageUrl'] as String?,
      serviceGroup: json['service_group'] as String?,
    );

Map<String, dynamic> _$ServiceModelToJson(_ServiceModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'service_name': instance.name,
      'rate': instance.rate,
      'duration': instance.duration,
      'description': instance.description,
      'imageUrl': instance.image,
      'service_group': instance.serviceGroup,
    };
