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

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'service_name') String get name;@JsonKey(name: 'rate') num get rate;@JsonKey(name: 'duration') String? get duration;@JsonKey(name: 'description') String? get description;@JsonKey(name: 'imageUrl') String? get image;@JsonKey(name: 'service_group') String? get serviceGroup;@JsonKey(name: 'menu') ServiceMenu? get menu;@JsonKey(name: 'whats_included') List<String>? get whatsIncluded;
/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceModelCopyWith<ServiceModel> get copyWith => _$ServiceModelCopyWithImpl<ServiceModel>(this as ServiceModel, _$identity);

  /// Serializes this ServiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.serviceGroup, serviceGroup) || other.serviceGroup == serviceGroup)&&(identical(other.menu, menu) || other.menu == menu)&&const DeepCollectionEquality().equals(other.whatsIncluded, whatsIncluded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rate,duration,description,image,serviceGroup,menu,const DeepCollectionEquality().hash(whatsIncluded));

@override
String toString() {
  return 'ServiceModel(id: $id, name: $name, rate: $rate, duration: $duration, description: $description, image: $image, serviceGroup: $serviceGroup, menu: $menu, whatsIncluded: $whatsIncluded)';
}


}

/// @nodoc
abstract mixin class $ServiceModelCopyWith<$Res>  {
  factory $ServiceModelCopyWith(ServiceModel value, $Res Function(ServiceModel) _then) = _$ServiceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'service_name') String name,@JsonKey(name: 'rate') num rate,@JsonKey(name: 'duration') String? duration,@JsonKey(name: 'description') String? description,@JsonKey(name: 'imageUrl') String? image,@JsonKey(name: 'service_group') String? serviceGroup,@JsonKey(name: 'menu') ServiceMenu? menu,@JsonKey(name: 'whats_included') List<String>? whatsIncluded
});


$ServiceMenuCopyWith<$Res>? get menu;

}
/// @nodoc
class _$ServiceModelCopyWithImpl<$Res>
    implements $ServiceModelCopyWith<$Res> {
  _$ServiceModelCopyWithImpl(this._self, this._then);

  final ServiceModel _self;
  final $Res Function(ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? rate = null,Object? duration = freezed,Object? description = freezed,Object? image = freezed,Object? serviceGroup = freezed,Object? menu = freezed,Object? whatsIncluded = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as num,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,serviceGroup: freezed == serviceGroup ? _self.serviceGroup : serviceGroup // ignore: cast_nullable_to_non_nullable
as String?,menu: freezed == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as ServiceMenu?,whatsIncluded: freezed == whatsIncluded ? _self.whatsIncluded : whatsIncluded // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceMenuCopyWith<$Res>? get menu {
    if (_self.menu == null) {
    return null;
  }

  return $ServiceMenuCopyWith<$Res>(_self.menu!, (value) {
    return _then(_self.copyWith(menu: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ServiceModel implements ServiceModel {
  const _ServiceModel({@JsonKey(name: '_id') this.id, @JsonKey(name: 'service_name') required this.name, @JsonKey(name: 'rate') required this.rate, @JsonKey(name: 'duration') this.duration, @JsonKey(name: 'description') this.description, @JsonKey(name: 'imageUrl') this.image, @JsonKey(name: 'service_group') this.serviceGroup, @JsonKey(name: 'menu') this.menu, @JsonKey(name: 'whats_included') final  List<String>? whatsIncluded}): _whatsIncluded = whatsIncluded;
  factory _ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'service_name') final  String name;
@override@JsonKey(name: 'rate') final  num rate;
@override@JsonKey(name: 'duration') final  String? duration;
@override@JsonKey(name: 'description') final  String? description;
@override@JsonKey(name: 'imageUrl') final  String? image;
@override@JsonKey(name: 'service_group') final  String? serviceGroup;
@override@JsonKey(name: 'menu') final  ServiceMenu? menu;
 final  List<String>? _whatsIncluded;
@override@JsonKey(name: 'whats_included') List<String>? get whatsIncluded {
  final value = _whatsIncluded;
  if (value == null) return null;
  if (_whatsIncluded is EqualUnmodifiableListView) return _whatsIncluded;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.description, description) || other.description == description)&&(identical(other.image, image) || other.image == image)&&(identical(other.serviceGroup, serviceGroup) || other.serviceGroup == serviceGroup)&&(identical(other.menu, menu) || other.menu == menu)&&const DeepCollectionEquality().equals(other._whatsIncluded, _whatsIncluded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,rate,duration,description,image,serviceGroup,menu,const DeepCollectionEquality().hash(_whatsIncluded));

@override
String toString() {
  return 'ServiceModel(id: $id, name: $name, rate: $rate, duration: $duration, description: $description, image: $image, serviceGroup: $serviceGroup, menu: $menu, whatsIncluded: $whatsIncluded)';
}


}

/// @nodoc
abstract mixin class _$ServiceModelCopyWith<$Res> implements $ServiceModelCopyWith<$Res> {
  factory _$ServiceModelCopyWith(_ServiceModel value, $Res Function(_ServiceModel) _then) = __$ServiceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'service_name') String name,@JsonKey(name: 'rate') num rate,@JsonKey(name: 'duration') String? duration,@JsonKey(name: 'description') String? description,@JsonKey(name: 'imageUrl') String? image,@JsonKey(name: 'service_group') String? serviceGroup,@JsonKey(name: 'menu') ServiceMenu? menu,@JsonKey(name: 'whats_included') List<String>? whatsIncluded
});


@override $ServiceMenuCopyWith<$Res>? get menu;

}
/// @nodoc
class __$ServiceModelCopyWithImpl<$Res>
    implements _$ServiceModelCopyWith<$Res> {
  __$ServiceModelCopyWithImpl(this._self, this._then);

  final _ServiceModel _self;
  final $Res Function(_ServiceModel) _then;

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? rate = null,Object? duration = freezed,Object? description = freezed,Object? image = freezed,Object? serviceGroup = freezed,Object? menu = freezed,Object? whatsIncluded = freezed,}) {
  return _then(_ServiceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as num,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,serviceGroup: freezed == serviceGroup ? _self.serviceGroup : serviceGroup // ignore: cast_nullable_to_non_nullable
as String?,menu: freezed == menu ? _self.menu : menu // ignore: cast_nullable_to_non_nullable
as ServiceMenu?,whatsIncluded: freezed == whatsIncluded ? _self._whatsIncluded : whatsIncluded // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ServiceModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServiceMenuCopyWith<$Res>? get menu {
    if (_self.menu == null) {
    return null;
  }

  return $ServiceMenuCopyWith<$Res>(_self.menu!, (value) {
    return _then(_self.copyWith(menu: value));
  });
}
}


/// @nodoc
mixin _$ServiceMenu {

@JsonKey(name: 'starters') List<String>? get starters;@JsonKey(name: 'main_course') List<String>? get mainCourse;@JsonKey(name: 'desserts') List<String>? get desserts;
/// Create a copy of ServiceMenu
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceMenuCopyWith<ServiceMenu> get copyWith => _$ServiceMenuCopyWithImpl<ServiceMenu>(this as ServiceMenu, _$identity);

  /// Serializes this ServiceMenu to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceMenu&&const DeepCollectionEquality().equals(other.starters, starters)&&const DeepCollectionEquality().equals(other.mainCourse, mainCourse)&&const DeepCollectionEquality().equals(other.desserts, desserts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(starters),const DeepCollectionEquality().hash(mainCourse),const DeepCollectionEquality().hash(desserts));

@override
String toString() {
  return 'ServiceMenu(starters: $starters, mainCourse: $mainCourse, desserts: $desserts)';
}


}

/// @nodoc
abstract mixin class $ServiceMenuCopyWith<$Res>  {
  factory $ServiceMenuCopyWith(ServiceMenu value, $Res Function(ServiceMenu) _then) = _$ServiceMenuCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'starters') List<String>? starters,@JsonKey(name: 'main_course') List<String>? mainCourse,@JsonKey(name: 'desserts') List<String>? desserts
});




}
/// @nodoc
class _$ServiceMenuCopyWithImpl<$Res>
    implements $ServiceMenuCopyWith<$Res> {
  _$ServiceMenuCopyWithImpl(this._self, this._then);

  final ServiceMenu _self;
  final $Res Function(ServiceMenu) _then;

/// Create a copy of ServiceMenu
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? starters = freezed,Object? mainCourse = freezed,Object? desserts = freezed,}) {
  return _then(_self.copyWith(
starters: freezed == starters ? _self.starters : starters // ignore: cast_nullable_to_non_nullable
as List<String>?,mainCourse: freezed == mainCourse ? _self.mainCourse : mainCourse // ignore: cast_nullable_to_non_nullable
as List<String>?,desserts: freezed == desserts ? _self.desserts : desserts // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ServiceMenu implements ServiceMenu {
  const _ServiceMenu({@JsonKey(name: 'starters') final  List<String>? starters, @JsonKey(name: 'main_course') final  List<String>? mainCourse, @JsonKey(name: 'desserts') final  List<String>? desserts}): _starters = starters,_mainCourse = mainCourse,_desserts = desserts;
  factory _ServiceMenu.fromJson(Map<String, dynamic> json) => _$ServiceMenuFromJson(json);

 final  List<String>? _starters;
@override@JsonKey(name: 'starters') List<String>? get starters {
  final value = _starters;
  if (value == null) return null;
  if (_starters is EqualUnmodifiableListView) return _starters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _mainCourse;
@override@JsonKey(name: 'main_course') List<String>? get mainCourse {
  final value = _mainCourse;
  if (value == null) return null;
  if (_mainCourse is EqualUnmodifiableListView) return _mainCourse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _desserts;
@override@JsonKey(name: 'desserts') List<String>? get desserts {
  final value = _desserts;
  if (value == null) return null;
  if (_desserts is EqualUnmodifiableListView) return _desserts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ServiceMenu
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceMenuCopyWith<_ServiceMenu> get copyWith => __$ServiceMenuCopyWithImpl<_ServiceMenu>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceMenuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceMenu&&const DeepCollectionEquality().equals(other._starters, _starters)&&const DeepCollectionEquality().equals(other._mainCourse, _mainCourse)&&const DeepCollectionEquality().equals(other._desserts, _desserts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_starters),const DeepCollectionEquality().hash(_mainCourse),const DeepCollectionEquality().hash(_desserts));

@override
String toString() {
  return 'ServiceMenu(starters: $starters, mainCourse: $mainCourse, desserts: $desserts)';
}


}

/// @nodoc
abstract mixin class _$ServiceMenuCopyWith<$Res> implements $ServiceMenuCopyWith<$Res> {
  factory _$ServiceMenuCopyWith(_ServiceMenu value, $Res Function(_ServiceMenu) _then) = __$ServiceMenuCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'starters') List<String>? starters,@JsonKey(name: 'main_course') List<String>? mainCourse,@JsonKey(name: 'desserts') List<String>? desserts
});




}
/// @nodoc
class __$ServiceMenuCopyWithImpl<$Res>
    implements _$ServiceMenuCopyWith<$Res> {
  __$ServiceMenuCopyWithImpl(this._self, this._then);

  final _ServiceMenu _self;
  final $Res Function(_ServiceMenu) _then;

/// Create a copy of ServiceMenu
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? starters = freezed,Object? mainCourse = freezed,Object? desserts = freezed,}) {
  return _then(_ServiceMenu(
starters: freezed == starters ? _self._starters : starters // ignore: cast_nullable_to_non_nullable
as List<String>?,mainCourse: freezed == mainCourse ? _self._mainCourse : mainCourse // ignore: cast_nullable_to_non_nullable
as List<String>?,desserts: freezed == desserts ? _self._desserts : desserts // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
