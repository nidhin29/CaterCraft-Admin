import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class OwnerInfo with _$OwnerInfo {
  const factory OwnerInfo({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'companyName') String? companyName,
    @JsonKey(name: 'companyLogo') String? companyLogo,
  }) = _OwnerInfo;

  factory OwnerInfo.fromJson(Map<String, dynamic> json) => _$OwnerInfoFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'role') int? role, // 1 for Owner, 2 for Staff
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'designation') String? designation,
    @JsonKey(name: 'profileImage') String? profileImage,
    @JsonKey(name: 'profileImageThumbnail') String? profileImageThumbnail,
    @JsonKey(name: 'companyName') String? companyName,
    @JsonKey(name: 'companyLogo') String? companyLogo,
    @JsonKey(name: 'companyLogoThumbnail') String? companyLogoThumbnail,
    @JsonKey(name: 'verificationStatus') String? verificationStatus,
    @JsonKey(name: 'isEmailVerified') bool? isEmailVerified,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'owner') dynamic owner,
    @JsonKey(name: 'isPasswordUpdated') bool? isPasswordUpdated,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
    @JsonKey(name: 'chatPublicKey') String? chatPublicKey,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  // Getter to handle the populated owner object
  OwnerInfo? get ownerInfo {
    if (owner is Map<String, dynamic>) {
      return OwnerInfo.fromJson(owner as Map<String, dynamic>);
    }
    return null;
  }
}
