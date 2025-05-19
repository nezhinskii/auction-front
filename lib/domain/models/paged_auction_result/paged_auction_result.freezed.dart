// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_auction_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PagedAuctionResult _$PagedAuctionResultFromJson(Map<String, dynamic> json) {
  return _PagedAuctionResult.fromJson(json);
}

/// @nodoc
mixin _$PagedAuctionResult {
  List<Auction> get auctions => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PagedAuctionResultCopyWith<PagedAuctionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedAuctionResultCopyWith<$Res> {
  factory $PagedAuctionResultCopyWith(
          PagedAuctionResult value, $Res Function(PagedAuctionResult) then) =
      _$PagedAuctionResultCopyWithImpl<$Res, PagedAuctionResult>;
  @useResult
  $Res call(
      {List<Auction> auctions, int totalCount, int pageNumber, int pageSize});
}

/// @nodoc
class _$PagedAuctionResultCopyWithImpl<$Res, $Val extends PagedAuctionResult>
    implements $PagedAuctionResultCopyWith<$Res> {
  _$PagedAuctionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctions = null,
    Object? totalCount = null,
    Object? pageNumber = null,
    Object? pageSize = null,
  }) {
    return _then(_value.copyWith(
      auctions: null == auctions
          ? _value.auctions
          : auctions // ignore: cast_nullable_to_non_nullable
              as List<Auction>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PagedAuctionResultImplCopyWith<$Res>
    implements $PagedAuctionResultCopyWith<$Res> {
  factory _$$PagedAuctionResultImplCopyWith(_$PagedAuctionResultImpl value,
          $Res Function(_$PagedAuctionResultImpl) then) =
      __$$PagedAuctionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Auction> auctions, int totalCount, int pageNumber, int pageSize});
}

/// @nodoc
class __$$PagedAuctionResultImplCopyWithImpl<$Res>
    extends _$PagedAuctionResultCopyWithImpl<$Res, _$PagedAuctionResultImpl>
    implements _$$PagedAuctionResultImplCopyWith<$Res> {
  __$$PagedAuctionResultImplCopyWithImpl(_$PagedAuctionResultImpl _value,
      $Res Function(_$PagedAuctionResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? auctions = null,
    Object? totalCount = null,
    Object? pageNumber = null,
    Object? pageSize = null,
  }) {
    return _then(_$PagedAuctionResultImpl(
      auctions: null == auctions
          ? _value._auctions
          : auctions // ignore: cast_nullable_to_non_nullable
              as List<Auction>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PagedAuctionResultImpl implements _PagedAuctionResult {
  const _$PagedAuctionResultImpl(
      {required final List<Auction> auctions,
      required this.totalCount,
      required this.pageNumber,
      required this.pageSize})
      : _auctions = auctions;

  factory _$PagedAuctionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagedAuctionResultImplFromJson(json);

  final List<Auction> _auctions;
  @override
  List<Auction> get auctions {
    if (_auctions is EqualUnmodifiableListView) return _auctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_auctions);
  }

  @override
  final int totalCount;
  @override
  final int pageNumber;
  @override
  final int pageSize;

  @override
  String toString() {
    return 'PagedAuctionResult(auctions: $auctions, totalCount: $totalCount, pageNumber: $pageNumber, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagedAuctionResultImpl &&
            const DeepCollectionEquality().equals(other._auctions, _auctions) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_auctions),
      totalCount,
      pageNumber,
      pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PagedAuctionResultImplCopyWith<_$PagedAuctionResultImpl> get copyWith =>
      __$$PagedAuctionResultImplCopyWithImpl<_$PagedAuctionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagedAuctionResultImplToJson(
      this,
    );
  }
}

abstract class _PagedAuctionResult implements PagedAuctionResult {
  const factory _PagedAuctionResult(
      {required final List<Auction> auctions,
      required final int totalCount,
      required final int pageNumber,
      required final int pageSize}) = _$PagedAuctionResultImpl;

  factory _PagedAuctionResult.fromJson(Map<String, dynamic> json) =
      _$PagedAuctionResultImpl.fromJson;

  @override
  List<Auction> get auctions;
  @override
  int get totalCount;
  @override
  int get pageNumber;
  @override
  int get pageSize;
  @override
  @JsonKey(ignore: true)
  _$$PagedAuctionResultImplCopyWith<_$PagedAuctionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
