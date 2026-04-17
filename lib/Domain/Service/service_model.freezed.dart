// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceModel {

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'service_name') String get name;@JsonKey(name: 'rate') num get rate;@JsonKey(name: 'duration') String? get duration;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'imageUrl') String? get image;@JsonKey(name: 'service_group') String? get serviceGroup;
/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceModelCopyWith<ServiceModel> get copyWith => _$ServiceModelCopyWithImpl<ServiceModel>(this as ServiceModel, _$identity);

  /// Serializes this ServiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.serviceGroup, serviceGroup) || other.serviceGroup == serviceGroup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rate,duration,description,image,serviceGroup);

@override
String toString() {
  return 'ServiceModel(id: $id, name: $name, rate: $rate, duration: $duration, description: $description, image: $image, serviceGroup: $serviceGroup)';
}


}

/// @nodoc
abstract mixin class $ServiceModelCopyWith<$Res>  {
  factory $ServiceModelCopyWith(ServiceModel value, $Res Function(ServiceModel) _then) = _$ServiceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'service_name') String name,@JsonKey(name: 'rate') num rate,@JsonKey(name: 'duration') String? duration,@JsonKey(name: 'description') String? description,@JsonKey(name: 'imageUrl') String? image,@JsonKey(name: 'service_group') String? serviceGroup
});




}
/// @nodoc
class _$ServiceModelCopyWithImpl<$Res>
    implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._self, this._then);

  final ServiceModel _self;
  final $Res Function(ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? rate = null,Object? duration = freezed,Object? description = freezed,Object? image = freezed,Object? serviceGroup = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as num,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,serviceGroup: freezed == serviceGroup ? _self.serviceGroup : serviceGroup // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ServiceModel implements ServiceModel {
  const _ServiceModel({@JsonKey(name: '_id') this.id, @JsonKey(name: 'service_name') required this.name, @JsonKey(name: 'rate') required this.rate, @JsonKey(name: 'duration') this.duration, @JsonKey(name: 'description') this.description, @JsonKey(name: 'imageUrl') this.image, @JsonKey(name: 'service_group') this.serviceGroup});
  factory _ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'service_name') final  String name;
@override@JsonKey(name: 'rate') final  num rate;
@override@JsonKey(name: 'duration') final  String? duration;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'imageUrl') final  String? image;
@override@JsonKey(name: 'service_group') final  String? serviceGroup;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceModelCopyWith<_ServiceModel> get copyWith => __$ServiceModelCopyWithImpl<_ServiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.serviceGroup, serviceGroup) || other.serviceGroup == serviceGroup));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rate,duration,description,image,serviceGroup);

@override
String toString() {
  return 'ServiceModel(id: $id, name: $name, rate: $rate, duration: $duration, description: $description, image: $image, serviceGroup: $serviceGroup)';
}


}

/// @nodoc
abstract mixin class _$ServiceModelCopyWith<$Res> implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(_ServiceModel value, $Res Function(_ServiceModel) _then) = __$ServiceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'service_name') String name,@JsonKey(name: 'rate') num rate,@JsonKey(name: 'duration') String? duration,@JsonKey(name: 'description') String? description,@JsonKey(name: 'imageUrl') String? image,@JsonKey(name: 'service_group') String? serviceGroup
});




}
/// @nodoc
class __$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(this._self, this._then);

  final _ServiceModel _self;
  final $Res Function(_ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? rate = null,Object? duration = freezed,Object? description = freezed,Object? image = freezed,Object? serviceGroup = freezed,}) {
  return _then(_ServiceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as num,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,serviceGroup: freezed == serviceGroup ? _self.serviceGroup : serviceGroup // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
