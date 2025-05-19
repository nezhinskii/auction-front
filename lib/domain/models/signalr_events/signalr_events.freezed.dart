// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signalr_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuctionStatusUpdate {
  int get auctionId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuctionStatusUpdateCopyWith<AuctionStatusUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionStatusUpdateCopyWith<$Res> {
  factory $AuctionStatusUpdateCopyWith(
          AuctionStatusUpdate value, $Res Function(AuctionStatusUpdate) then) =
      _$AuctionStatusUpdateCopyWithImpl<$Res, AuctionStatusUpdate>;
  @useResult
  $Res call({int auctionId, String status});
}

/// @nodoc
class _$AuctionStatusUpdateCopyWithImpl<$Res, $Val extends AuctionStatusUpdate>
    implements $AuctionStatusUpdateCopyWith<$Res> {
  _$AuctionStatusUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuctionStatusUpdateImplCopyWith<$Res>
    implements $AuctionStatusUpdateCopyWith<$Res> {
  factory _$$AuctionStatusUpdateImplCopyWith(_$AuctionStatusUpdateImpl value,
          $Res Function(_$AuctionStatusUpdateImpl) then) =
      __$$AuctionStatusUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int auctionId, String status});
}

/// @nodoc
class __$$AuctionStatusUpdateImplCopyWithImpl<$Res>
    extends _$AuctionStatusUpdateCopyWithImpl<$Res, _$AuctionStatusUpdateImpl>
    implements _$$AuctionStatusUpdateImplCopyWith<$Res> {
  __$$AuctionStatusUpdateImplCopyWithImpl(_$AuctionStatusUpdateImpl _value,
      $Res Function(_$AuctionStatusUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? status = null,
  }) {
    return _then(_$AuctionStatusUpdateImpl(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuctionStatusUpdateImpl implements _AuctionStatusUpdate {
  const _$AuctionStatusUpdateImpl(
      {required this.auctionId, required this.status});

  @override
  final int auctionId;
  @override
  final String status;

  @override
  String toString() {
    return 'AuctionStatusUpdate(auctionId: $auctionId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuctionStatusUpdateImpl &&
            (identical(other.auctionId, auctionId) ||
                other.auctionId == auctionId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, auctionId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuctionStatusUpdateImplCopyWith<_$AuctionStatusUpdateImpl> get copyWith =>
      __$$AuctionStatusUpdateImplCopyWithImpl<_$AuctionStatusUpdateImpl>(
          this, _$identity);
}

abstract class _AuctionStatusUpdate implements AuctionStatusUpdate {
  const factory _AuctionStatusUpdate(
      {required final int auctionId,
      required final String status}) = _$AuctionStatusUpdateImpl;

  @override
  int get auctionId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$AuctionStatusUpdateImplCopyWith<_$AuctionStatusUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NewAuctionNotification {
  int get auctionId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewAuctionNotificationCopyWith<NewAuctionNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAuctionNotificationCopyWith<$Res> {
  factory $NewAuctionNotificationCopyWith(NewAuctionNotification value,
          $Res Function(NewAuctionNotification) then) =
      _$NewAuctionNotificationCopyWithImpl<$Res, NewAuctionNotification>;
  @useResult
  $Res call({int auctionId, String title});
}

/// @nodoc
class _$NewAuctionNotificationCopyWithImpl<$Res,
        $Val extends NewAuctionNotification>
    implements $NewAuctionNotificationCopyWith<$Res> {
  _$NewAuctionNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewAuctionNotificationImplCopyWith<$Res>
    implements $NewAuctionNotificationCopyWith<$Res> {
  factory _$$NewAuctionNotificationImplCopyWith(
          _$NewAuctionNotificationImpl value,
          $Res Function(_$NewAuctionNotificationImpl) then) =
      __$$NewAuctionNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int auctionId, String title});
}

/// @nodoc
class __$$NewAuctionNotificationImplCopyWithImpl<$Res>
    extends _$NewAuctionNotificationCopyWithImpl<$Res,
        _$NewAuctionNotificationImpl>
    implements _$$NewAuctionNotificationImplCopyWith<$Res> {
  __$$NewAuctionNotificationImplCopyWithImpl(
      _$NewAuctionNotificationImpl _value,
      $Res Function(_$NewAuctionNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? title = null,
  }) {
    return _then(_$NewAuctionNotificationImpl(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewAuctionNotificationImpl implements _NewAuctionNotification {
  const _$NewAuctionNotificationImpl(
      {required this.auctionId, required this.title});

  @override
  final int auctionId;
  @override
  final String title;

  @override
  String toString() {
    return 'NewAuctionNotification(auctionId: $auctionId, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewAuctionNotificationImpl &&
            (identical(other.auctionId, auctionId) ||
                other.auctionId == auctionId) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, auctionId, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewAuctionNotificationImplCopyWith<_$NewAuctionNotificationImpl>
      get copyWith => __$$NewAuctionNotificationImplCopyWithImpl<
          _$NewAuctionNotificationImpl>(this, _$identity);
}

abstract class _NewAuctionNotification implements NewAuctionNotification {
  const factory _NewAuctionNotification(
      {required final int auctionId,
      required final String title}) = _$NewAuctionNotificationImpl;

  @override
  int get auctionId;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$NewAuctionNotificationImplCopyWith<_$NewAuctionNotificationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OutbidNotification {
  int get auctionId => throw _privateConstructorUsedError;
  String get auctionTitle => throw _privateConstructorUsedError;
  double get newBidAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OutbidNotificationCopyWith<OutbidNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutbidNotificationCopyWith<$Res> {
  factory $OutbidNotificationCopyWith(
          OutbidNotification value, $Res Function(OutbidNotification) then) =
      _$OutbidNotificationCopyWithImpl<$Res, OutbidNotification>;
  @useResult
  $Res call({int auctionId, String auctionTitle, double newBidAmount});
}

/// @nodoc
class _$OutbidNotificationCopyWithImpl<$Res, $Val extends OutbidNotification>
    implements $OutbidNotificationCopyWith<$Res> {
  _$OutbidNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? auctionTitle = null,
    Object? newBidAmount = null,
  }) {
    return _then(_value.copyWith(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as int,
      auctionTitle: null == auctionTitle
          ? _value.auctionTitle
          : auctionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      newBidAmount: null == newBidAmount
          ? _value.newBidAmount
          : newBidAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OutbidNotificationImplCopyWith<$Res>
    implements $OutbidNotificationCopyWith<$Res> {
  factory _$$OutbidNotificationImplCopyWith(_$OutbidNotificationImpl value,
          $Res Function(_$OutbidNotificationImpl) then) =
      __$$OutbidNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int auctionId, String auctionTitle, double newBidAmount});
}

/// @nodoc
class __$$OutbidNotificationImplCopyWithImpl<$Res>
    extends _$OutbidNotificationCopyWithImpl<$Res, _$OutbidNotificationImpl>
    implements _$$OutbidNotificationImplCopyWith<$Res> {
  __$$OutbidNotificationImplCopyWithImpl(_$OutbidNotificationImpl _value,
      $Res Function(_$OutbidNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctionId = null,
    Object? auctionTitle = null,
    Object? newBidAmount = null,
  }) {
    return _then(_$OutbidNotificationImpl(
      auctionId: null == auctionId
          ? _value.auctionId
          : auctionId // ignore: cast_nullable_to_non_nullable
              as int,
      auctionTitle: null == auctionTitle
          ? _value.auctionTitle
          : auctionTitle // ignore: cast_nullable_to_non_nullable
              as String,
      newBidAmount: null == newBidAmount
          ? _value.newBidAmount
          : newBidAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$OutbidNotificationImpl implements _OutbidNotification {
  const _$OutbidNotificationImpl(
      {required this.auctionId,
      required this.auctionTitle,
      required this.newBidAmount});

  @override
  final int auctionId;
  @override
  final String auctionTitle;
  @override
  final double newBidAmount;

  @override
  String toString() {
    return 'OutbidNotification(auctionId: $auctionId, auctionTitle: $auctionTitle, newBidAmount: $newBidAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutbidNotificationImpl &&
            (identical(other.auctionId, auctionId) ||
                other.auctionId == auctionId) &&
            (identical(other.auctionTitle, auctionTitle) ||
                other.auctionTitle == auctionTitle) &&
            (identical(other.newBidAmount, newBidAmount) ||
                other.newBidAmount == newBidAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, auctionId, auctionTitle, newBidAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OutbidNotificationImplCopyWith<_$OutbidNotificationImpl> get copyWith =>
      __$$OutbidNotificationImplCopyWithImpl<_$OutbidNotificationImpl>(
          this, _$identity);
}

abstract class _OutbidNotification implements OutbidNotification {
  const factory _OutbidNotification(
      {required final int auctionId,
      required final String auctionTitle,
      required final double newBidAmount}) = _$OutbidNotificationImpl;

  @override
  int get auctionId;
  @override
  String get auctionTitle;
  @override
  double get newBidAmount;
  @override
  @JsonKey(ignore: true)
  _$$OutbidNotificationImplCopyWith<_$OutbidNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
