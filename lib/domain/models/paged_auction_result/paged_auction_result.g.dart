// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_auction_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PagedAuctionResultImpl _$$PagedAuctionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PagedAuctionResultImpl(
      auctions: (json['auctions'] as List<dynamic>)
          .map((e) => Auction.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num).toInt(),
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
    );

Map<String, dynamic> _$$PagedAuctionResultImplToJson(
        _$PagedAuctionResultImpl instance) =>
    <String, dynamic>{
      'auctions': instance.auctions,
      'totalCount': instance.totalCount,
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
    };
