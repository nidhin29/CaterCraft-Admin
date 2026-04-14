// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerInfo _$OwnerInfoFromJson(Map<String, dynamic> json) => _OwnerInfo(
  id: json['_id'] as String?,
  companyName: json['companyName'] as String?,
  companyLogo: json['companyLogo'] as String?,
);

Map<String, dynamic> _$OwnerInfoToJson(_OwnerInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['_id'] as String?,
  email: json['email'] as String,
  role: (json['role'] as num).toInt(),
  fullName: json['fullName'] as String?,
  name: json['name'] as String?,
  designation: json['designation'] as String?,
  profileImage: json['profileImage'] as String?,
  profileImageThumbnail: json['profileImageThumbnail'] as String?,
  companyName: json['companyName'] as String?,
  companyLogo: json['companyLogo'] as String?,
  companyLogoThumbnail: json['companyLogoThumbnail'] as String?,
  verificationStatus: json['verificationStatus'] as String?,
  isEmailVerified: json['isEmailVerified'] as bool?,
  username: json['username'] as String?,
  owner: json['owner'],
  isPasswordUpdated: json['isPasswordUpdated'] as bool?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'fullName': instance.fullName,
      'name': instance.name,
      'designation': instance.designation,
      'profileImage': instance.profileImage,
      'profileImageThumbnail': instance.profileImageThumbnail,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'companyLogoThumbnail': instance.companyLogoThumbnail,
      'verificationStatus': instance.verificationStatus,
      'isEmailVerified': instance.isEmailVerified,
      'username': instance.username,
      'owner': instance.owner,
      'isPasswordUpdated': instance.isPasswordUpdated,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
