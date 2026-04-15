// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationModel {

 String get roomId; String get lastMessage; String get lastMessageTime; String get otherUserId; String get otherUserName; String? get otherUserImage; String get otherUserType; bool get isOnline; int get unreadCount;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationModelCopyWith<ConversationModel> get copyWith => _$ConversationModelCopyWithImpl<ConversationModel>(this as ConversationModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationModel&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUserName, otherUserName) || other.otherUserName == otherUserName)&&(identical(other.otherUserImage, otherUserImage) || other.otherUserImage == otherUserImage)&&(identical(other.otherUserType, otherUserType) || other.otherUserType == otherUserType)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,lastMessage,lastMessageTime,otherUserId,otherUserName,otherUserImage,otherUserType,isOnline,unreadCount);

@override
String toString() {
  return 'ConversationModel(roomId: $roomId, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, otherUserId: $otherUserId, otherUserName: $otherUserName, otherUserImage: $otherUserImage, otherUserType: $otherUserType, isOnline: $isOnline, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class $ConversationModelCopyWith<$Res>  {
  factory $ConversationModelCopyWith(ConversationModel value, $Res Function(ConversationModel) _then) = _$ConversationModelCopyWithImpl;
@useResult
$Res call({
 String roomId, String lastMessage, String lastMessageTime, String otherUserId, String otherUserName, String? otherUserImage, String otherUserType, bool isOnline, int unreadCount
});




}
/// @nodoc
class _$ConversationModelCopyWithImpl<$Res>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._self, this._then);

  final ConversationModel _self;
  final $Res Function(ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomId = null,Object? lastMessage = null,Object? lastMessageTime = null,Object? otherUserId = null,Object? otherUserName = null,Object? otherUserImage = freezed,Object? otherUserType = null,Object? isOnline = null,Object? unreadCount = null,}) {
  return _then(_self.copyWith(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageTime: null == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as String,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,otherUserName: null == otherUserName ? _self.otherUserName : otherUserName // ignore: cast_nullable_to_non_nullable
as String,otherUserImage: freezed == otherUserImage ? _self.otherUserImage : otherUserImage // ignore: cast_nullable_to_non_nullable
as String?,otherUserType: null == otherUserType ? _self.otherUserType : otherUserType // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc


class _ConversationModel implements ConversationModel {
  const _ConversationModel({required this.roomId, required this.lastMessage, required this.lastMessageTime, required this.otherUserId, required this.otherUserName, this.otherUserImage, required this.otherUserType, this.isOnline = false, this.unreadCount = 0});
  

@override final  String roomId;
@override final  String lastMessage;
@override final  String lastMessageTime;
@override final  String otherUserId;
@override final  String otherUserName;
@override final  String? otherUserImage;
@override final  String otherUserType;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  int unreadCount;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationModelCopyWith<_ConversationModel> get copyWith => __$ConversationModelCopyWithImpl<_ConversationModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationModel&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.otherUserName, otherUserName) || other.otherUserName == otherUserName)&&(identical(other.otherUserImage, otherUserImage) || other.otherUserImage == otherUserImage)&&(identical(other.otherUserType, otherUserType) || other.otherUserType == otherUserType)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount));
}


@override
int get hashCode => Object.hash(runtimeType,roomId,lastMessage,lastMessageTime,otherUserId,otherUserName,otherUserImage,otherUserType,isOnline,unreadCount);

@override
String toString() {
  return 'ConversationModel(roomId: $roomId, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, otherUserId: $otherUserId, otherUserName: $otherUserName, otherUserImage: $otherUserImage, otherUserType: $otherUserType, isOnline: $isOnline, unreadCount: $unreadCount)';
}


}

/// @nodoc
abstract mixin class _$ConversationModelCopyWith<$Res> implements $ConversationModelCopyWith<$Res> {
  factory _$ConversationModelCopyWith(_ConversationModel value, $Res Function(_ConversationModel) _then) = __$ConversationModelCopyWithImpl;
@override @useResult
$Res call({
 String roomId, String lastMessage, String lastMessageTime, String otherUserId, String otherUserName, String? otherUserImage, String otherUserType, bool isOnline, int unreadCount
});




}
/// @nodoc
class __$ConversationModelCopyWithImpl<$Res>
    implements _$ConversationModelCopyWith<$Res> {
  __$ConversationModelCopyWithImpl(this._self, this._then);

  final _ConversationModel _self;
  final $Res Function(_ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomId = null,Object? lastMessage = null,Object? lastMessageTime = null,Object? otherUserId = null,Object? otherUserName = null,Object? otherUserImage = freezed,Object? otherUserType = null,Object? isOnline = null,Object? unreadCount = null,}) {
  return _then(_ConversationModel(
roomId: null == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String,lastMessage: null == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String,lastMessageTime: null == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as String,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,otherUserName: null == otherUserName ? _self.otherUserName : otherUserName // ignore: cast_nullable_to_non_nullable
as String,otherUserImage: freezed == otherUserImage ? _self.otherUserImage : otherUserImage // ignore: cast_nullable_to_non_nullable
as String?,otherUserType: null == otherUserType ? _self.otherUserType : otherUserType // ignore: cast_nullable_to_non_nullable
as String,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
