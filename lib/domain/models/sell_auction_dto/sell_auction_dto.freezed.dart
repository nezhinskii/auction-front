// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sell_auction_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SellAuctionDto _$SellAuctionDtoFromJson(Map<String, dynamic> json) {
  return _SellAuctionDto.fromJson(json);
}

/// @nodoc
mixin _$SellAuctionDto {
  int get winningBidId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellAuctionDtoCopyWith<SellAuctionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellAuctionDtoCopyWith<$Res> {
  factory $SellAuctionDtoCopyWith(
          SellAuctionDto value, $Res Function(SellAuctionDto) then) =
      _$SellAuctionDtoCopyWithImpl<$Res, SellAuctionDto>;
  @useResult
  $Res call({int winningBidId});
}

/// @nodoc
class _$SellAuctionDtoCopyWithImpl<$Res, $Val extends SellAuctionDto>
    implements $SellAuctionDtoCopyWith<$Res> {
  _$SellAuctionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winningBidId = null,
  }) {
    return _then(_value.copyWith(
      winningBidId: null == winningBidId
          ? _value.winningBidId
          : winningBidId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SellAuctionDtoImplCopyWith<$Res>
    implements $SellAuctionDtoCopyWith<$Res> {
  factory _$$SellAuctionDtoImplCopyWith(_$SellAuctionDtoImpl value,
          $Res Function(_$SellAuctionDtoImpl) then) =
      __$$SellAuctionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int winningBidId});
}

/// @nodoc
class __$$SellAuctionDtoImplCopyWithImpl<$Res>
    extends _$SellAuctionDtoCopyWithImpl<$Res, _$SellAuctionDtoImpl>
    implements _$$SellAuctionDtoImplCopyWith<$Res> {
  __$$SellAuctionDtoImplCopyWithImpl(
      _$SellAuctionDtoImpl _value, $Res Function(_$SellAuctionDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winningBidId = null,
  }) {
    return _then(_$SellAuctionDtoImpl(
      winningBidId: null == winningBidId
          ? _value.winningBidId
          : winningBidId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SellAuctionDtoImpl implements _SellAuctionDto {
  const _$SellAuctionDtoImpl({required this.winningBidId});

  factory _$SellAuctionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SellAuctionDtoImplFromJson(json);

  @override
  final int winningBidId;

  @override
  String toString() {
    return 'SellAuctionDto(winningBidId: $winningBidId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellAuctionDtoImpl &&
            (identical(other.winningBidId, winningBidId) ||
                other.winningBidId == winningBidId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, winningBidId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellAuctionDtoImplCopyWith<_$SellAuctionDtoImpl> get copyWith =>
      __$$SellAuctionDtoImplCopyWithImpl<_$SellAuctionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SellAuctionDtoImplToJson(
      this,
    );
  }
}

abstract class _SellAuctionDto implements SellAuctionDto {
  const factory _SellAuctionDto({required final int winningBidId}) =
      _$SellAuctionDtoImpl;

  factory _SellAuctionDto.fromJson(Map<String, dynamic> json) =
      _$SellAuctionDtoImpl.fromJson;

  @override
  int get winningBidId;
  @override
  @JsonKey(ignore: true)
  _$$SellAuctionDtoImplCopyWith<_$SellAuctionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
