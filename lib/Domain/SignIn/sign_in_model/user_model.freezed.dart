// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnerInfo {

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'companyName') String? get companyName;@JsonKey(name: 'companyLogo') String? get companyLogo;
/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerInfoCopyWith<OwnerInfo> get copyWith => _$OwnerInfoCopyWithImpl<OwnerInfo>(this as OwnerInfo, _$identity);

  /// Serializes this OwnerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,companyLogo);

@override
String toString() {
  return 'OwnerInfo(id: $id, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class $OwnerInfoCopyWith<$Res>  {
  factory $OwnerInfoCopyWith(OwnerInfo value, $Res Function(OwnerInfo) _then) = _$OwnerInfoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'companyName') String? companyName,@JsonKey(name: 'companyLogo') String? companyLogo
});




}
/// @nodoc
class _$OwnerInfoCopyWithImpl<$Res>
    implements $OwnerInfoCopyWith<$Res> {
  _$OwnerInfoCopyWithImpl(this._self, this._then);

  final OwnerInfo _self;
  final $Res Function(OwnerInfo) _then;

/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _OwnerInfo implements OwnerInfo {
  const _OwnerInfo({@JsonKey(name: '_id') this.id, @JsonKey(name: 'companyName') this.companyName, @JsonKey(name: 'companyLogo') this.companyLogo});
  factory _OwnerInfo.fromJson(Map<String, dynamic> json) => _$OwnerInfoFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'companyName') final  String? companyName;
@override@JsonKey(name: 'companyLogo') final  String? companyLogo;

/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerInfoCopyWith<_OwnerInfo> get copyWith => __$OwnerInfoCopyWithImpl<_OwnerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,companyLogo);

@override
String toString() {
  return 'OwnerInfo(id: $id, companyName: $companyName, companyLogo: $companyLogo)';
}


}

/// @nodoc
abstract mixin class _$OwnerInfoCopyWith<$Res> implements $OwnerInfoCopyWith<$Res> {
  factory _$OwnerInfoCopyWith(_OwnerInfo value, $Res Function(_OwnerInfo) _then) = __$OwnerInfoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'companyName') String? companyName,@JsonKey(name: 'companyLogo') String? companyLogo
});




}
/// @nodoc
class __$OwnerInfoCopyWithImpl<$Res>
    implements _$OwnerInfoCopyWith<$Res> {
  __$OwnerInfoCopyWithImpl(this._self, this._then);

  final _OwnerInfo _self;
  final $Res Function(_OwnerInfo) _then;

/// Create a copy of OwnerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyName = freezed,Object? companyLogo = freezed,}) {
  return _then(_OwnerInfo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UserModel {

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'email') String? get email;@JsonKey(name: 'role') int? get role;// 1 for Owner, 2 for Staff
@JsonKey(name: 'fullName') String? get fullName;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'designation') String? get designation;@JsonKey(name: 'profileImage') String? get profileImage;@JsonKey(name: 'profileImageThumbnail') String? get profileImageThumbnail;@JsonKey(name: 'companyName') String? get companyName;@JsonKey(name: 'companyLogo') String? get companyLogo;@JsonKey(name: 'companyLogoThumbnail') String? get companyLogoThumbnail;@JsonKey(name: 'verificationStatus') String? get verificationStatus;@JsonKey(name: 'isEmailVerified') bool? get isEmailVerified;@JsonKey(name: 'username') String? get username;@JsonKey(name: 'owner') dynamic get owner;@JsonKey(name: 'isPasswordUpdated') bool? get isPasswordUpdated;@JsonKey(name: 'createdAt') String? get createdAt;@JsonKey(name: 'updatedAt') String? get updatedAt;@JsonKey(name: 'chatPublicKey') String? get chatPublicKey;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.profileImageThumbnail, profileImageThumbnail) || other.profileImageThumbnail == profileImageThumbnail)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo)&&(identical(other.companyLogoThumbnail, companyLogoThumbnail) || other.companyLogoThumbnail == companyLogoThumbnail)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other.owner, owner)&&(identical(other.isPasswordUpdated, isPasswordUpdated) || other.isPasswordUpdated == isPasswordUpdated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.chatPublicKey, chatPublicKey) || other.chatPublicKey == chatPublicKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,email,role,fullName,name,designation,profileImage,profileImageThumbnail,companyName,companyLogo,companyLogoThumbnail,verificationStatus,isEmailVerified,username,const DeepCollectionEquality().hash(owner),isPasswordUpdated,createdAt,updatedAt,chatPublicKey]);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, role: $role, fullName: $fullName, name: $name, designation: $designation, profileImage: $profileImage, profileImageThumbnail: $profileImageThumbnail, companyName: $companyName, companyLogo: $companyLogo, companyLogoThumbnail: $companyLogoThumbnail, verificationStatus: $verificationStatus, isEmailVerified: $isEmailVerified, username: $username, owner: $owner, isPasswordUpdated: $isPasswordUpdated, createdAt: $createdAt, updatedAt: $updatedAt, chatPublicKey: $chatPublicKey)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'email') String? email,@JsonKey(name: 'role') int? role,@JsonKey(name: 'fullName') String? fullName,@JsonKey(name: 'name') String? name,@JsonKey(name: 'designation') String? designation,@JsonKey(name: 'profileImage') String? profileImage,@JsonKey(name: 'profileImageThumbnail') String? profileImageThumbnail,@JsonKey(name: 'companyName') String? companyName,@JsonKey(name: 'companyLogo') String? companyLogo,@JsonKey(name: 'companyLogoThumbnail') String? companyLogoThumbnail,@JsonKey(name: 'verificationStatus') String? verificationStatus,@JsonKey(name: 'isEmailVerified') bool? isEmailVerified,@JsonKey(name: 'username') String? username,@JsonKey(name: 'owner') dynamic owner,@JsonKey(name: 'isPasswordUpdated') bool? isPasswordUpdated,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'chatPublicKey') String? chatPublicKey
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? role = freezed,Object? fullName = freezed,Object? name = freezed,Object? designation = freezed,Object? profileImage = freezed,Object? profileImageThumbnail = freezed,Object? companyName = freezed,Object? companyLogo = freezed,Object? companyLogoThumbnail = freezed,Object? verificationStatus = freezed,Object? isEmailVerified = freezed,Object? username = freezed,Object? owner = freezed,Object? isPasswordUpdated = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? chatPublicKey = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,profileImageThumbnail: freezed == profileImageThumbnail ? _self.profileImageThumbnail : profileImageThumbnail // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,companyLogoThumbnail: freezed == companyLogoThumbnail ? _self.companyLogoThumbnail : companyLogoThumbnail // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isEmailVerified: freezed == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as dynamic,isPasswordUpdated: freezed == isPasswordUpdated ? _self.isPasswordUpdated : isPasswordUpdated // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,chatPublicKey: freezed == chatPublicKey ? _self.chatPublicKey : chatPublicKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({@JsonKey(name: '_id') this.id, @JsonKey(name: 'email') this.email, @JsonKey(name: 'role') this.role, @JsonKey(name: 'fullName') this.fullName, @JsonKey(name: 'name') this.name, @JsonKey(name: 'designation') this.designation, @JsonKey(name: 'profileImage') this.profileImage, @JsonKey(name: 'profileImageThumbnail') this.profileImageThumbnail, @JsonKey(name: 'companyName') this.companyName, @JsonKey(name: 'companyLogo') this.companyLogo, @JsonKey(name: 'companyLogoThumbnail') this.companyLogoThumbnail, @JsonKey(name: 'verificationStatus') this.verificationStatus, @JsonKey(name: 'isEmailVerified') this.isEmailVerified, @JsonKey(name: 'username') this.username, @JsonKey(name: 'owner') this.owner, @JsonKey(name: 'isPasswordUpdated') this.isPasswordUpdated, @JsonKey(name: 'createdAt') this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt, @JsonKey(name: 'chatPublicKey') this.chatPublicKey}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'email') final  String? email;
@override@JsonKey(name: 'role') final  int? role;
// 1 for Owner, 2 for Staff
@override@JsonKey(name: 'fullName') final  String? fullName;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'designation') final  String? designation;
@override@JsonKey(name: 'profileImage') final  String? profileImage;
@override@JsonKey(name: 'profileImageThumbnail') final  String? profileImageThumbnail;
@override@JsonKey(name: 'companyName') final  String? companyName;
@override@JsonKey(name: 'companyLogo') final  String? companyLogo;
@override@JsonKey(name: 'companyLogoThumbnail') final  String? companyLogoThumbnail;
@override@JsonKey(name: 'verificationStatus') final  String? verificationStatus;
@override@JsonKey(name: 'isEmailVerified') final  bool? isEmailVerified;
@override@JsonKey(name: 'username') final  String? username;
@override@JsonKey(name: 'owner') final  dynamic owner;
@override@JsonKey(name: 'isPasswordUpdated') final  bool? isPasswordUpdated;
@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey(name: 'updatedAt') final  String? updatedAt;
@override@JsonKey(name: 'chatPublicKey') final  String? chatPublicKey;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.profileImageThumbnail, profileImageThumbnail) || other.profileImageThumbnail == profileImageThumbnail)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyLogo, companyLogo) || other.companyLogo == companyLogo)&&(identical(other.companyLogoThumbnail, companyLogoThumbnail) || other.companyLogoThumbnail == companyLogoThumbnail)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.username, username) || other.username == username)&&const DeepCollectionEquality().equals(other.owner, owner)&&(identical(other.isPasswordUpdated, isPasswordUpdated) || other.isPasswordUpdated == isPasswordUpdated)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.chatPublicKey, chatPublicKey) || other.chatPublicKey == chatPublicKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,email,role,fullName,name,designation,profileImage,profileImageThumbnail,companyName,companyLogo,companyLogoThumbnail,verificationStatus,isEmailVerified,username,const DeepCollectionEquality().hash(owner),isPasswordUpdated,createdAt,updatedAt,chatPublicKey]);

@override
String toString() {
  return 'UserModel(id: $id, email: $email, role: $role, fullName: $fullName, name: $name, designation: $designation, profileImage: $profileImage, profileImageThumbnail: $profileImageThumbnail, companyName: $companyName, companyLogo: $companyLogo, companyLogoThumbnail: $companyLogoThumbnail, verificationStatus: $verificationStatus, isEmailVerified: $isEmailVerified, username: $username, owner: $owner, isPasswordUpdated: $isPasswordUpdated, createdAt: $createdAt, updatedAt: $updatedAt, chatPublicKey: $chatPublicKey)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'email') String? email,@JsonKey(name: 'role') int? role,@JsonKey(name: 'fullName') String? fullName,@JsonKey(name: 'name') String? name,@JsonKey(name: 'designation') String? designation,@JsonKey(name: 'profileImage') String? profileImage,@JsonKey(name: 'profileImageThumbnail') String? profileImageThumbnail,@JsonKey(name: 'companyName') String? companyName,@JsonKey(name: 'companyLogo') String? companyLogo,@JsonKey(name: 'companyLogoThumbnail') String? companyLogoThumbnail,@JsonKey(name: 'verificationStatus') String? verificationStatus,@JsonKey(name: 'isEmailVerified') bool? isEmailVerified,@JsonKey(name: 'username') String? username,@JsonKey(name: 'owner') dynamic owner,@JsonKey(name: 'isPasswordUpdated') bool? isPasswordUpdated,@JsonKey(name: 'createdAt') String? createdAt,@JsonKey(name: 'updatedAt') String? updatedAt,@JsonKey(name: 'chatPublicKey') String? chatPublicKey
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? role = freezed,Object? fullName = freezed,Object? name = freezed,Object? designation = freezed,Object? profileImage = freezed,Object? profileImageThumbnail = freezed,Object? companyName = freezed,Object? companyLogo = freezed,Object? companyLogoThumbnail = freezed,Object? verificationStatus = freezed,Object? isEmailVerified = freezed,Object? username = freezed,Object? owner = freezed,Object? isPasswordUpdated = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? chatPublicKey = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,profileImageThumbnail: freezed == profileImageThumbnail ? _self.profileImageThumbnail : profileImageThumbnail // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyLogo: freezed == companyLogo ? _self.companyLogo : companyLogo // ignore: cast_nullable_to_non_nullable
as String?,companyLogoThumbnail: freezed == companyLogoThumbnail ? _self.companyLogoThumbnail : companyLogoThumbnail // ignore: cast_nullable_to_non_nullable
as String?,verificationStatus: freezed == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isEmailVerified: freezed == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as dynamic,isPasswordUpdated: freezed == isPasswordUpdated ? _self.isPasswordUpdated : isPasswordUpdated // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,chatPublicKey: freezed == chatPublicKey ? _self.chatPublicKey : chatPublicKey // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
