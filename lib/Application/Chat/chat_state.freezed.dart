// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {

 bool get isLoading; List<MessageModel> get messages; String? get error; int get currentPage; bool get hasMore; bool get isLoadMoreLoading; bool get isOtherUserTyping;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.error, error) || other.error == error)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadMoreLoading, isLoadMoreLoading) || other.isLoadMoreLoading == isLoadMoreLoading)&&(identical(other.isOtherUserTyping, isOtherUserTyping) || other.isOtherUserTyping == isOtherUserTyping));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(messages),error,currentPage,hasMore,isLoadMoreLoading,isOtherUserTyping);

@override
String toString() {
  return 'ChatState(isLoading: $isLoading, messages: $messages, error: $error, currentPage: $currentPage, hasMore: $hasMore, isLoadMoreLoading: $isLoadMoreLoading, isOtherUserTyping: $isOtherUserTyping)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<MessageModel> messages, String? error, int currentPage, bool hasMore, bool isLoadMoreLoading, bool isOtherUserTyping
});




}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? messages = null,Object? error = freezed,Object? currentPage = null,Object? hasMore = null,Object? isLoadMoreLoading = null,Object? isOtherUserTyping = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadMoreLoading: null == isLoadMoreLoading ? _self.isLoadMoreLoading : isLoadMoreLoading // ignore: cast_nullable_to_non_nullable
as bool,isOtherUserTyping: null == isOtherUserTyping ? _self.isOtherUserTyping : isOtherUserTyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _ChatState implements ChatState {
  const _ChatState({required this.isLoading, required final  List<MessageModel> messages, required this.error, this.currentPage = 1, this.hasMore = true, this.isLoadMoreLoading = false, this.isOtherUserTyping = false}): _messages = messages;
  

@override final  bool isLoading;
 final  List<MessageModel> _messages;
@override List<MessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String? error;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadMoreLoading;
@override@JsonKey() final  bool isOtherUserTyping;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.error, error) || other.error == error)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadMoreLoading, isLoadMoreLoading) || other.isLoadMoreLoading == isLoadMoreLoading)&&(identical(other.isOtherUserTyping, isOtherUserTyping) || other.isOtherUserTyping == isOtherUserTyping));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_messages),error,currentPage,hasMore,isLoadMoreLoading,isOtherUserTyping);

@override
String toString() {
  return 'ChatState(isLoading: $isLoading, messages: $messages, error: $error, currentPage: $currentPage, hasMore: $hasMore, isLoadMoreLoading: $isLoadMoreLoading, isOtherUserTyping: $isOtherUserTyping)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<MessageModel> messages, String? error, int currentPage, bool hasMore, bool isLoadMoreLoading, bool isOtherUserTyping
});




}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? messages = null,Object? error = freezed,Object? currentPage = null,Object? hasMore = null,Object? isLoadMoreLoading = null,Object? isOtherUserTyping = null,}) {
  return _then(_ChatState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<MessageModel>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadMoreLoading: null == isLoadMoreLoading ? _self.isLoadMoreLoading : isLoadMoreLoading // ignore: cast_nullable_to_non_nullable
as bool,isOtherUserTyping: null == isOtherUserTyping ? _self.isOtherUserTyping : isOtherUserTyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
