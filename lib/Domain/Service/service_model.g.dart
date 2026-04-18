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
      menu:
          json['menu'] == null
              ? null
              : ServiceMenu.fromJson(json['menu'] as Map<String, dynamic>),
      whatsIncluded:
          (json['whats_included'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
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
      'menu': instance.menu,
      'whats_included': instance.whatsIncluded,
    };

_ServiceMenu _$ServiceMenuFromJson(Map<String, dynamic> json) => _ServiceMenu(
  starters:
      (json['starters'] as List<dynamic>?)?.map((e) => e as String).toList(),
  mainCourse:
      (json['main_course'] as List<dynamic>?)?.map((e) => e as String).toList(),
  desserts:
      (json['desserts'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ServiceMenuToJson(_ServiceMenu instance) =>
    <String, dynamic>{
      'starters': instance.starters,
      'main_course': instance.mainCourse,
      'desserts': instance.desserts,
    };
