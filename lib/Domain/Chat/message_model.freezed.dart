// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageModel {

@JsonKey(name: '_id') String? get id; String get senderId; String get senderType; String get receiverId; String get receiverType; String get message; String get room;@JsonKey(name: 'imageUrl') String? get imageUrl; bool get isEveryoneDeleted; List<String> get deletedBy;@JsonKey(name: 'createdAt') String? get createdAt; bool get isEncrypted;@JsonKey(name: 'encryptionNonce') String? get encryptionNonce;
/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageModelCopyWith<MessageModel> get copyWith => _$MessageModelCopyWithImpl<MessageModel>(this as MessageModel, _$identity);

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.receiverType, receiverType) || other.receiverType == receiverType)&&(identical(other.message, message) || other.message == message)&&(identical(other.room, room) || other.room == room)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isEveryoneDeleted, isEveryoneDeleted) || other.isEveryoneDeleted == isEveryoneDeleted)&&const DeepCollectionEquality().equals(other.deletedBy, deletedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isEncrypted, isEncrypted) || other.isEncrypted == isEncrypted)&&(identical(other.encryptionNonce, encryptionNonce) || other.encryptionNonce == encryptionNonce));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderType,receiverId,receiverType,message,room,imageUrl,isEveryoneDeleted,const DeepCollectionEquality().hash(deletedBy),createdAt,isEncrypted,encryptionNonce);

@override
String toString() {
  return 'MessageModel(id: $id, senderId: $senderId, senderType: $senderType, receiverId: $receiverId, receiverType: $receiverType, message: $message, room: $room, imageUrl: $imageUrl, isEveryoneDeleted: $isEveryoneDeleted, deletedBy: $deletedBy, createdAt: $createdAt, isEncrypted: $isEncrypted, encryptionNonce: $encryptionNonce)';
}


}

/// @nodoc
abstract mixin class $MessageModelCopyWith<$Res>  {
  factory $MessageModelCopyWith(MessageModel value, $Res Function(MessageModel) _then) = _$MessageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String senderId, String senderType, String receiverId, String receiverType, String message, String room,@JsonKey(name: 'imageUrl') String? imageUrl, bool isEveryoneDeleted, List<String> deletedBy,@JsonKey(name: 'createdAt') String? createdAt, bool isEncrypted,@JsonKey(name: 'encryptionNonce') String? encryptionNonce
});




}
/// @nodoc
class _$MessageModelCopyWithImpl<$Res>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._self, this._then);

  final MessageModel _self;
  final $Res Function(MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? senderId = null,Object? senderType = null,Object? receiverId = null,Object? receiverType = null,Object? message = null,Object? room = null,Object? imageUrl = freezed,Object? isEveryoneDeleted = null,Object? deletedBy = null,Object? createdAt = freezed,Object? isEncrypted = null,Object? encryptionNonce = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,receiverType: null == receiverType ? _self.receiverType : receiverType // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isEveryoneDeleted: null == isEveryoneDeleted ? _self.isEveryoneDeleted : isEveryoneDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedBy: null == deletedBy ? _self.deletedBy : deletedBy // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isEncrypted: null == isEncrypted ? _self.isEncrypted : isEncrypted // ignore: cast_nullable_to_non_nullable
as bool,encryptionNonce: freezed == encryptionNonce ? _self.encryptionNonce : encryptionNonce // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MessageModel implements MessageModel {
  const _MessageModel({@JsonKey(name: '_id') this.id, required this.senderId, required this.senderType, required this.receiverId, required this.receiverType, required this.message, required this.room, @JsonKey(name: 'imageUrl') this.imageUrl, this.isEveryoneDeleted = false, final  List<String> deletedBy = const [], @JsonKey(name: 'createdAt') this.createdAt, this.isEncrypted = false, @JsonKey(name: 'encryptionNonce') this.encryptionNonce}): _deletedBy = deletedBy;
  factory _MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String senderId;
@override final  String senderType;
@override final  String receiverId;
@override final  String receiverType;
@override final  String message;
@override final  String room;
@override@JsonKey(name: 'imageUrl') final  String? imageUrl;
@override@JsonKey() final  bool isEveryoneDeleted;
 final  List<String> _deletedBy;
@override@JsonKey() List<String> get deletedBy {
  if (_deletedBy is EqualUnmodifiableListView) return _deletedBy;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_deletedBy);
}

@override@JsonKey(name: 'createdAt') final  String? createdAt;
@override@JsonKey() final  bool isEncrypted;
@override@JsonKey(name: 'encryptionNonce') final  String? encryptionNonce;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageModelCopyWith<_MessageModel> get copyWith => __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.receiverId, receiverId) || other.receiverId == receiverId)&&(identical(other.receiverType, receiverType) || other.receiverType == receiverType)&&(identical(other.message, message) || other.message == message)&&(identical(other.room, room) || other.room == room)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.isEveryoneDeleted, isEveryoneDeleted) || other.isEveryoneDeleted == isEveryoneDeleted)&&const DeepCollectionEquality().equals(other._deletedBy, _deletedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isEncrypted, isEncrypted) || other.isEncrypted == isEncrypted)&&(identical(other.encryptionNonce, encryptionNonce) || other.encryptionNonce == encryptionNonce));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,senderId,senderType,receiverId,receiverType,message,room,imageUrl,isEveryoneDeleted,const DeepCollectionEquality().hash(_deletedBy),createdAt,isEncrypted,encryptionNonce);

@override
String toString() {
  return 'MessageModel(id: $id, senderId: $senderId, senderType: $senderType, receiverId: $receiverId, receiverType: $receiverType, message: $message, room: $room, imageUrl: $imageUrl, isEveryoneDeleted: $isEveryoneDeleted, deletedBy: $deletedBy, createdAt: $createdAt, isEncrypted: $isEncrypted, encryptionNonce: $encryptionNonce)';
}


}

/// @nodoc
abstract mixin class _$MessageModelCopyWith<$Res> implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(_MessageModel value, $Res Function(_MessageModel) _then) = __$MessageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String senderId, String senderType, String receiverId, String receiverType, String message, String room,@JsonKey(name: 'imageUrl') String? imageUrl, bool isEveryoneDeleted, List<String> deletedBy,@JsonKey(name: 'createdAt') String? createdAt, bool isEncrypted,@JsonKey(name: 'encryptionNonce') String? encryptionNonce
});




}
/// @nodoc
class __$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(this._self, this._then);

  final _MessageModel _self;
  final $Res Function(_MessageModel) _then;

/// Create a copy of MessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? senderId = null,Object? senderType = null,Object? receiverId = null,Object? receiverType = null,Object? message = null,Object? room = null,Object? imageUrl = freezed,Object? isEveryoneDeleted = null,Object? deletedBy = null,Object? createdAt = freezed,Object? isEncrypted = null,Object? encryptionNonce = freezed,}) {
  return _then(_MessageModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as String,receiverId: null == receiverId ? _self.receiverId : receiverId // ignore: cast_nullable_to_non_nullable
as String,receiverType: null == receiverType ? _self.receiverType : receiverType // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,room: null == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,isEveryoneDeleted: null == isEveryoneDeleted ? _self.isEveryoneDeleted : isEveryoneDeleted // ignore: cast_nullable_to_non_nullable
as bool,deletedBy: null == deletedBy ? _self._deletedBy : deletedBy // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,isEncrypted: null == isEncrypted ? _self.isEncrypted : isEncrypted // ignore: cast_nullable_to_non_nullable
as bool,encryptionNonce: freezed == encryptionNonce ? _self.encryptionNonce : encryptionNonce // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
