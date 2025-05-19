// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_bid_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceBidDto _$PlaceBidDtoFromJson(Map<String, dynamic> json) {
  return _PlaceBidDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceBidDto {
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceBidDtoCopyWith<PlaceBidDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceBidDtoCopyWith<$Res> {
  factory $PlaceBidDtoCopyWith(
          PlaceBidDto value, $Res Function(PlaceBidDto) then) =
      _$PlaceBidDtoCopyWithImpl<$Res, PlaceBidDto>;
  @useResult
  $Res call({double amount});
}

/// @nodoc
class _$PlaceBidDtoCopyWithImpl<$Res, $Val extends PlaceBidDto>
    implements $PlaceBidDtoCopyWith<$Res> {
  _$PlaceBidDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceBidDtoImplCopyWith<$Res>
    implements $PlaceBidDtoCopyWith<$Res> {
  factory _$$PlaceBidDtoImplCopyWith(
          _$PlaceBidDtoImpl value, $Res Function(_$PlaceBidDtoImpl) then) =
      __$$PlaceBidDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount});
}

/// @nodoc
class __$$PlaceBidDtoImplCopyWithImpl<$Res>
    extends _$PlaceBidDtoCopyWithImpl<$Res, _$PlaceBidDtoImpl>
    implements _$$PlaceBidDtoImplCopyWith<$Res> {
  __$$PlaceBidDtoImplCopyWithImpl(
      _$PlaceBidDtoImpl _value, $Res Function(_$PlaceBidDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
  }) {
    return _then(_$PlaceBidDtoImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceBidDtoImpl implements _PlaceBidDto {
  const _$PlaceBidDtoImpl({required this.amount});

  factory _$PlaceBidDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceBidDtoImplFromJson(json);

  @override
  final double amount;

  @override
  String toString() {
    return 'PlaceBidDto(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceBidDtoImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceBidDtoImplCopyWith<_$PlaceBidDtoImpl> get copyWith =>
      __$$PlaceBidDtoImplCopyWithImpl<_$PlaceBidDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceBidDtoImplToJson(
      this,
    );
  }
}

abstract class _PlaceBidDto implements PlaceBidDto {
  const factory _PlaceBidDto({required final double amount}) =
      _$PlaceBidDtoImpl;

  factory _PlaceBidDto.fromJson(Map<String, dynamic> json) =
      _$PlaceBidDtoImpl.fromJson;

  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$PlaceBidDtoImplCopyWith<_$PlaceBidDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
